import 'package:bta3_physia/features/lesson_quiz/models/lesson_quiz_result_model.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_results_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonQuizResultsCubit extends Cubit<LessonQuizResultsState> {
  LessonQuizResultsCubit({LessonQuizResultModel? result})
    : super(
        LessonQuizResultsState(
          result: result ?? LessonQuizResultModel.defaultResults,
        ),
      );

  void load(LessonQuizResultModel result) {
    emit(state.copyWith(result: result));
  }
}
