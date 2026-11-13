import 'package:equatable/equatable.dart';

class LessonQuizModel extends Equatable {
  const LessonQuizModel({
    required this.id,
    required this.title,
    required this.questionText,
    required this.degrees,
    required this.answersText,
    required this.correctAnswerIndex,
    this.selectedAnswerIndex,
  });

  final String id;
  final String title;
  final String questionText;
  final int degrees;
  final List<String> answersText;
  final int correctAnswerIndex;
  final int? selectedAnswerIndex;

  bool get isAnswered => selectedAnswerIndex != null;

  bool get isCorrect =>
      selectedAnswerIndex != null && selectedAnswerIndex == correctAnswerIndex;

  LessonQuizModel copyWith({
    String? id,
    String? title,
    String? questionText,
    int? degrees,
    List<String>? answersText,
    int? correctAnswerIndex,
    int? selectedAnswerIndex,
  }) {
    return LessonQuizModel(
      id: id ?? this.id,
      title: title ?? this.title,

      questionText: questionText ?? this.questionText,
      degrees: degrees ?? this.degrees,
      answersText: answersText ?? this.answersText,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    questionText,
    degrees,
    answersText,
    correctAnswerIndex,
    selectedAnswerIndex,
  ];

  static List<LessonQuizModel> defaultQuestions() {
    return const [
      LessonQuizModel(
        id: '1',
        title: 'الدرس الأول',
        questionText: 'عاد جسم إلى نقطة البداية، ما مقدار إزاحته؟',
        degrees: 2,
        answersText: ['صفر', 'المسافة الكلية', 'نصف المسافة', 'ضعف المسافة'],
        correctAnswerIndex: 0,
      ),
      LessonQuizModel(
        id: '2',
        title: 'الدرس الأول',
        questionText: 'تسير سيارة بسرعة ثابتة ٢٠ م/ث لمدة ٥ ثوانٍ، ما المسافة التي قطعتها؟',
        degrees: 2,
        answersText: ['٤٠ مترًا', '٦٠ مترًا', '١٠٠ متر', '١٢٠ مترًا'],
        correctAnswerIndex: 2,
      ),
      LessonQuizModel(
        id: '3',
        title: 'الدرس الأول',
        questionText: 'ما مقدار سرعة جسم يقطع ١٢٠ مترًا في ٦ ثوانٍ؟',
        degrees: 2,
        answersText: ['٢٠ م/ث', '٦٠ م/ث', '١٢٠ م/ث', '٧٢٠ م/ث'],
        correctAnswerIndex: 0,
      ),
      LessonQuizModel(
        id: '4',
        title: 'الدرس الأول',
        questionText: 'أي العبارات التالية تصف جسمًا يتحرك بعجلة ثابتة؟',
        degrees: 2,
        answersText: [
          'تتغير سرعته بمعدل ثابت',
          'تبقى سرعته ثابتة',
          'تتغير إزاحته بمعدل ثابت',
          'تصبح عجلته صفرًا دائمًا',
        ],
        correctAnswerIndex: 0,
      ),
    ];
  }
}
