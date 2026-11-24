import '../error_model/app_error_model.dart';
import 'firebase_error_codes.dart';

abstract final class FirebaseErrorHandler {
  static AppErrorModel handleFirestore(String code) {
    return switch (code) {
      FirebaseErrorCodes.permissionDenied => const AppErrorModel(
        code: 'access_denied',
        message: 'ليس لديك صلاحية لعرض هذه البيانات.',
        type: AppErrorType.authorization,
        isRetryable: false,
      ),
      FirebaseErrorCodes.unauthenticated => const AppErrorModel(
        code: 'authentication_required',
        message: 'سجّل الدخول للمتابعة.',
        type: AppErrorType.authentication,
        isRetryable: false,
      ),
      FirebaseErrorCodes.unavailable => const AppErrorModel(
        code: 'service_unavailable',
        message: 'الخدمة غير متاحة حاليًا. حاول مرة أخرى لاحقًا.',
        type: AppErrorType.server,
        isRetryable: true,
      ),
      FirebaseErrorCodes.deadlineExceeded => const AppErrorModel(
        code: 'request_timeout',
        message: 'انتهت مهلة الطلب. حاول مرة أخرى.',
        type: AppErrorType.timeout,
        isRetryable: true,
      ),
      _ => const AppErrorModel(
        code: 'unexpected_error',
        message: 'حدث خطأ أثناء تحميل البيانات.',
        type: AppErrorType.unknown,
        isRetryable: false,
      ),
    };
  }

  static AppErrorModel handleAuth(String code) {
    return switch (code) {
      FirebaseErrorCodes.invalidCredential => const AppErrorModel(
        code: 'invalid_credentials',
        message: 'تحقّق من البريد الإلكتروني وكلمة المرور.',
        type: AppErrorType.authentication,
        isRetryable: false,
      ),
      FirebaseErrorCodes.emailAlreadyInUse => const AppErrorModel(
        code: 'email_already_in_use',
        message: 'هذا البريد الإلكتروني مستخدم بالفعل. جرّب تسجيل الدخول.',
        type: AppErrorType.conflict,
        isRetryable: false,
      ),
      FirebaseErrorCodes.userDisabled ||
      FirebaseErrorCodes.accountInactive => const AppErrorModel(
        code: 'account_inactive',
        message: 'حسابك موقوف. تواصل مع المدرّس.',
        type: AppErrorType.authorization,
        isRetryable: false,
      ),
      FirebaseErrorCodes.networkRequestFailed => const AppErrorModel(
        code: 'network_error',
        message: 'تحقّق من اتصالك بالإنترنت وحاول مرة أخرى.',
        type: AppErrorType.network,
        isRetryable: true,
      ),
      FirebaseErrorCodes.tooManyRequests => const AppErrorModel(
        code: 'too_many_requests',
        message:
            'تجاوزت الحد المسموح به للمحاولات. انتظر قليلًا ثم حاول مجددًا.',
        type: AppErrorType.rateLimit,
        isRetryable: false,
      ),
      FirebaseErrorCodes.operationNotAllowed => const AppErrorModel(
        code: 'auth_operation_not_allowed',
        message: 'الخدمة غير متاحة حاليًا. تواصل مع الدعم.',
        type: AppErrorType.server,
        isRetryable: false,
      ),
      FirebaseErrorCodes.gradeUnavailable => const AppErrorModel(
        code: 'grade_unavailable',
        message: 'الصف الذي اخترته لم يعد متاحًا. اختر صفًا آخر.',
        type: AppErrorType.validation,
        isRetryable: false,
      ),
      FirebaseErrorCodes.alreadyLoggedIn => const AppErrorModel(
        code: 'already_logged_in',
        message: 'توجد جلسة دخول نشطة لهذا الحساب. تواصل مع المدرّس لإنهائها.',
        type: AppErrorType.conflict,
        isRetryable: false,
      ),
      FirebaseErrorCodes.studentProfileMissing => const AppErrorModel(
        code: 'student_profile_missing',
        message: 'تعذّر العثور على ملف الطالب. تواصل مع المدرّس.',
        type: AppErrorType.notFound,
        isRetryable: false,
      ),
      FirebaseErrorCodes.loginUserMissing ||
      FirebaseErrorCodes.registrationUserMissing => const AppErrorModel(
        code: 'auth_user_missing',
        message: 'تعذّر إكمال العملية. تواصل مع الدعم.',
        type: AppErrorType.unknown,
        isRetryable: false,
      ),
      _ => const AppErrorModel(
        code: 'unexpected_auth_error',
        message: 'حدث خطأ أثناء تنفيذ العملية.',
        type: AppErrorType.unknown,
        isRetryable: false,
      ),
    };
  }
}
