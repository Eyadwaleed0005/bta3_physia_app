import {FieldValue, getFirestore} from "firebase-admin/firestore";
import {HttpsError, onCall} from "firebase-functions/v2/https";

type CreateStudentProfileInput = {
  fullName?: unknown;
  phoneNumber?: unknown;
  gradeId?: unknown;
};

export const createStudentProfile = onCall<CreateStudentProfileInput>(
  {maxInstances: 10},
  async (request) => {
    const auth = request.auth;
    if (!auth) {
      throw new HttpsError("unauthenticated", "سجّل الدخول للمتابعة.");
    }

    const email = auth.token.email;
    if (typeof email !== "string" || !email) {
      throw new HttpsError(
        "failed-precondition",
        "تعذّر تحديد بريد الحساب.",
      );
    }

    const {fullName, phoneNumber, gradeId} = request.data ?? {};

    if (
      typeof fullName !== "string" || !fullName.trim() ||
      typeof phoneNumber !== "string" || !phoneNumber.trim() ||
      typeof gradeId !== "string" || !gradeId.trim() ||
      gradeId.includes("/")
    ) {
      throw new HttpsError("invalid-argument", "تحقّق من بيانات الطالب.");
    }

    const db = getFirestore();
    const selectedGradeId = gradeId.trim();
    const studentRef = db.collection("student").doc(auth.uid);
    const gradeRef = db.collection("grades").doc(selectedGradeId);

    return db.runTransaction(async (transaction) => {
      const student = await transaction.get(studentRef);
      if (student.exists) {
        return {created: false};
      }

      const grade = await transaction.get(gradeRef);
      if (!grade.exists || grade.data()?.isDeleting !== false) {
        throw new HttpsError(
          "failed-precondition",
          "الصف المختار لم يعد متاحًا.",
          {code: "grade-unavailable"},
        );
      }

      transaction.create(studentRef, {
        name: fullName.trim(),
        email,
        phoneNumber: phoneNumber.trim(),
        gradeId: selectedGradeId,
        loggin: true,
        createdAt: FieldValue.serverTimestamp(),
      });

      return {created: true};
    });
  },
);
