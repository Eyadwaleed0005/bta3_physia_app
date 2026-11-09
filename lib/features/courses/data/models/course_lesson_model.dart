import 'package:equatable/equatable.dart';

enum LessonContentType {
  video('فيديو'),
  pdf('ملف PDF'),
  training('اختبار تدريبي');

  const LessonContentType(this.label);

  final String label;
}

class CourseLessonModel extends Equatable {
  const CourseLessonModel({
    required this.id,
    required this.title,
    required this.description,
    this.videoUrl = defaultVideoUrl,
    this.pdfUrl,
    this.trainingQuestions = 0,
    this.trainingMinutes = 15,
  });

  static const String defaultVideoUrl =
      'https://www.youtube.com/watch?v=CCRxEbi75iE&pp=ygUd2LTZgdiqINmD2YTYp9mFINmB2Yog2LHZhdi02YM%3D';
  static const String defaultPdfUrl =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

  final String id;
  final String title;
  final String description;
  final String videoUrl;

  final String? pdfUrl;
  final int trainingQuestions;
  final int trainingMinutes;

  bool get hasPdf => pdfUrl != null;

  bool get hasTraining => trainingQuestions > 0;

  List<LessonContentType> get contentTypes => [
    LessonContentType.video,
    if (hasPdf) LessonContentType.pdf,
    if (hasTraining) LessonContentType.training,
  ];

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    videoUrl,
    pdfUrl,
    trainingQuestions,
    trainingMinutes,
  ];
}
