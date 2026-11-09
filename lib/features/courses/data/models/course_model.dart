import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';
import 'package:equatable/equatable.dart';

enum CourseAccessType { free, paid }

class CourseModel extends Equatable {
  const CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.accessType,
    required this.lessons,
    this.price,
  });

  final String id;
  final String title;
  final String description;
  final CourseAccessType accessType;
  final List<CourseLessonModel> lessons;
  final int? price;

  bool get isFree => accessType == CourseAccessType.free;

  int get lessonsCount => lessons.length;

  bool matchesQuery(String query) {
    final String normalized = query.trim();
    if (normalized.isEmpty) return true;
    return title.contains(normalized) || description.contains(normalized);
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    accessType,
    lessons,
    price,
  ];

  static List<CourseModel> defaultItems() {
    return const [
      CourseModel(
        id: 'course_free_foundations',
        title: 'أساسيات الفيزياء',
        description: 'الكميات الفيزيائية ووحدات القياس',
        accessType: CourseAccessType.free,
        lessons: [
          CourseLessonModel(
            id: 'foundations_l1',
            title: 'الكميات الفيزيائية',
            description: 'الكميات الأساسية والمشتقة',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
            trainingQuestions: 8,
          ),
          CourseLessonModel(
            id: 'foundations_l2',
            title: 'وحدات القياس',
            description: 'النظام الدولي لوحدات القياس',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
          ),
          CourseLessonModel(
            id: 'foundations_l3',
            title: 'التحويل بين الوحدات',
            description: 'تطبيقات على تحويل وحدات القياس',
            trainingQuestions: 8,
          ),
          CourseLessonModel(
            id: 'foundations_l4',
            title: 'الأبعاد الفيزيائية',
            description: 'التحقق من صحة العلاقات الفيزيائية',
          ),
        ],
      ),
      CourseModel(
        id: 'course_free_measurement',
        title: 'القياس والأخطاء',
        description: 'أدوات القياس ودقته وأنواع الأخطاء',
        accessType: CourseAccessType.free,
        lessons: [
          CourseLessonModel(
            id: 'measurement_l1',
            title: 'أدوات القياس',
            description: 'اختبار الأداة المناسبة لكل قياس',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
          ),
          CourseLessonModel(
            id: 'measurement_l2',
            title: 'دقة القياس',
            description: 'قراءة التدريج وتحديد الدقة',
            trainingQuestions: 8,
          ),
          CourseLessonModel(
            id: 'measurement_l3',
            title: 'أنواع أخطاء القياس',
            description: 'التمييز بين الخطأ المنتظم والعشوائي',
          ),
          CourseLessonModel(
            id: 'measurement_l4',
            title: 'حساب نسبة الخطأ',
            description: 'التعبير عن الخطأ كنسبة مئوية',
          ),
        ],
      ),
      CourseModel(
        id: 'course_paid_newton',
        title: 'قوانين نيوتن وتطبيقاتها',
        description: 'قوانين نيوتن وتطبيقاتها على الحركة',
        accessType: CourseAccessType.paid,
        price: 250,
        lessons: [
          CourseLessonModel(
            id: 'newton_l1',
            title: 'القانون الأول لنيوتن',
            description: 'القصور الذاتي وتوازن الأجسام',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
            trainingQuestions: 10,
          ),
          CourseLessonModel(
            id: 'newton_l2',
            title: 'القانون الثاني لنيوتن',
            description: 'العلاقة بين القوة والكتلة والتسارع',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
          ),
          CourseLessonModel(
            id: 'newton_l3',
            title: 'القانون الثالث لنيوتن',
            description: 'الأفعال وردود الأفعال',
            trainingQuestions: 10,
          ),
          CourseLessonModel(
            id: 'newton_l4',
            title: 'تطبيقات على قوانين نيوتن',
            description: 'حل مسائل القوى والحركة',
          ),
        ],
      ),
      CourseModel(
        id: 'course_paid_motion',
        title: 'الحركة في خط مستقيم',
        description: 'المسافة والإزاحة والسرعة والتسارع',
        accessType: CourseAccessType.paid,
        price: 300,
        lessons: [
          CourseLessonModel(
            id: 'motion_l1',
            title: 'المسافة والإزاحة',
            description: 'الفرق بين المسافة والإزاحة',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
            trainingQuestions: 10,
          ),
          CourseLessonModel(
            id: 'motion_l2',
            title: 'السرعة المتجهة',
            description: 'السرعة المتوسطة واللحظية',
            pdfUrl: CourseLessonModel.defaultPdfUrl,
          ),
          CourseLessonModel(
            id: 'motion_l3',
            title: 'التسارع',
            description: 'تغير السرعة مع الزمن',
            trainingQuestions: 10,
          ),
          CourseLessonModel(
            id: 'motion_l4',
            title: 'معادلات الحركة',
            description: 'حل مسائل الحركة بتسارع ثابت',
          ),
        ],
      ),
    ];
  }
}