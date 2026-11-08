import 'package:equatable/equatable.dart';

class ExamQuestionModel extends Equatable {
  const ExamQuestionModel({
    required this.id,
    required this.questionText,
    required this.degrees,
    required this.answersText,
    required this.correctAnswerIndex,
    this.selectedAnswerIndex,
  });

  final String id;
  final String questionText;
  final int degrees;
  final List<String> answersText;
  final int correctAnswerIndex;
  final int? selectedAnswerIndex;

  bool get isAnswered => selectedAnswerIndex != null;

  bool get isCorrect =>
      selectedAnswerIndex != null && selectedAnswerIndex == correctAnswerIndex;

  ExamQuestionModel copyWith({
    String? id,
    String? questionText,
    int? degrees,
    List<String>? answersText,
    int? correctAnswerIndex,
    int? selectedAnswerIndex,
  }) {
    return ExamQuestionModel(
      id: id ?? this.id,
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
    questionText,
    degrees,
    answersText,
    correctAnswerIndex,
    selectedAnswerIndex,
  ];

  static List<ExamQuestionModel> defaultQuestions() {
    return const [
      ExamQuestionModel(
        id: '1',
        questionText: 'عاد جسم إلى نقطة البداية، ما مقدار إزاحته؟',
        degrees: 2,
        answersText: ['صفر', 'المسافة الكلية', 'نصف المسافة', 'ضعف المسافة'],
        correctAnswerIndex: 0,
      ),
      ExamQuestionModel(
        id: '2',
        questionText: 'تسير سيارة بسرعة ثابتة ٢٠ م/ث لمدة ٥ ثوانٍ، ما المسافة التي قطعتها؟',
        degrees: 2,
        answersText: ['٤٠ مترًا', '٦٠ مترًا', '١٠٠ متر', '١٢٠ مترًا'],
        correctAnswerIndex: 2,
      ),
      ExamQuestionModel(
        id: '3',
        questionText: 'ما مقدار سرعة جسم يقطع ١٢٠ مترًا في ٦ ثوانٍ؟',
        degrees: 2,
        answersText: ['٢٠ م/ث', '٦٠ م/ث', '١٢٠ م/ث', '٧٢٠ م/ث'],
        correctAnswerIndex: 0,
      ),
      ExamQuestionModel(
        id: '4',
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
      ExamQuestionModel(
        id: '5',
        questionText: 'عاد جسم إلى نقطة البداية، ما مقدار إزاحته؟',
        degrees: 2,
        answersText: ['صفر', 'المسافة الكلية', 'نصف المسافة', 'ضعف المسافة'],
        correctAnswerIndex: 0,
      ),
      ExamQuestionModel(
        id: '6',
        questionText: 'تسير سيارة بسرعة ثابتة ٢٠ م/ث لمدة ٥ ثوانٍ، ما المسافة التي قطعتها؟',
        degrees: 2,
        answersText: ['٤٠ مترًا', '٦٠ مترًا', '١٠٠ متر', '١٢٠ مترًا'],
        correctAnswerIndex: 2,
      ),
      ExamQuestionModel(
        id: '7',
        questionText: 'ما مقدار سرعة جسم يقطع ١٢٠ مترًا في ٦ ثوانٍ؟',
        degrees: 2,
        answersText: [
          '٢٠ م/ث',
          '٦٠ م/ث',
          '١٢٠ م/ث',
          '٧٢٠ م/ث',
          '٧٢٠ م/ث',
          '٧٢٠ م/ث',
          '٧٢٠ م/ث',
        ],
        correctAnswerIndex: 0,
      ),
      ExamQuestionModel(
        id: '8',
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
