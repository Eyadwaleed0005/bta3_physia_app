import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_screen_content_widgets/lesson_quiz_bottom_bar.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_screen_content_widgets/lesson_quiz_option_tile.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_screen_content_widgets/lesson_quiz_question_card.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_states/lesson_quiz_grading_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_states/lesson_quiz_pending_connection_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_states/lesson_quiz_starting_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_states/lesson_quiz_submitted_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizBodyForMode extends StatelessWidget {
  final LessonQuizState state;
  const LessonQuizBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LessonQuizCubit>();

    switch (state.viewMode) {
      case LessonQuizViewMode.starting:
        return const _QuizScrollable(child: LessonQuizStartingState());

      case LessonQuizViewMode.solving:
        return _buildSolvingBody(context, cubit);

      case LessonQuizViewMode.grading:
        return const _QuizScrollable(child: LessonQuizGradingState());

      case LessonQuizViewMode.submitted:
        return LessonQuizSubmittedState(
          onResultPressed: () {
            final result = state.result;
            if (result == null) return;

            Navigator.of(context).pushReplacementNamed(
              RouteNames.lessonQuizResultScreen,
              arguments: result,
            );
          },
        );

      case LessonQuizViewMode.pendingConnection:
        return _QuizScrollable(
          child: LessonQuizPendingConnectionState(
            onRetryPressed: () => cubit.retryPendingSubmission(),
            onReturnPressed: () => Navigator.of(context).pop(),
          ),
        );
    }
  }

  Widget _buildSolvingBody(BuildContext context, LessonQuizCubit cubit) {
    final question = state.currentQuestion;
    if (question == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(16),
                LessonQuizQuestionCard(state: state),
                verticalSpace(16),
                for (
                  int index = 0;
                  index < question.answersText.length;
                  index++
                ) ...[
                  if (index != 0) verticalSpace(10),
                  LessonQuizOptionTile(
                    index: index,
                    text: question.answersText[index],
                    isSelected: question.selectedAnswerIndex == index,
                    onTap: () => cubit.selectAnswer(index),
                  ),
                ],
              ],
            ),
          ),
        ),
        LessonQuizBottomBar(
          isFirstQuestion: state.isFirstQuestion,
          isLastQuestion: state.isLastQuestion,
          onBackToLessonPressed: () => Navigator.of(context).pop(),
          onPreviousPressed: cubit.previousQuestion,
          onNextPressed: cubit.nextQuestion,
          onSubmitPressed: cubit.confirmSubmission,
          isCurrentQuestionAnswered: state.isCurrentQuestionAnswered,
        ),
        verticalSpace(16),
      ],
    );
  }
}

class _QuizScrollable extends StatelessWidget {
  final Widget child;
  const _QuizScrollable({required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: child,
      ),
    );
  }
}
