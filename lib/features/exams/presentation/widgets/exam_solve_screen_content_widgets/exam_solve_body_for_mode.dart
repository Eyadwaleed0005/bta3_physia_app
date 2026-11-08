import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/duration_label_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/solve_bottom_bar.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/solve_option_tile.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/solve_progress_band.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/solve_question_card.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/solve_timer_strip.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_closed_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_confirm_submission_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_deleted_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_failure_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_grading_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_pending_connection_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_resume_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_starting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamSolveBodyForMode extends StatelessWidget {
  final ExamSolveState state;
  const ExamSolveBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamSolveCubit>();

    switch (state.viewMode) {
      case ExamSolveViewMode.starting:
        return const _SolveScrollable(child: ExamsStartingState());

      case ExamSolveViewMode.solving:
        return _buildSolvingBody(cubit);

      case ExamSolveViewMode.confirming:
        return _SolveScrollable(
          child: ExamsConfirmSubmissionState(
            countQuestions: state.unansweredCount.toString(),
            remainingTime: formatRemainingTime(cubit.remaining),
            onConfirmPressed: () => cubit.confirmSubmission(),
            onReturnPressed: () => cubit.cancelSubmission(),
          ),
        );

      case ExamSolveViewMode.grading:
      case ExamSolveViewMode.finished:
        return const _SolveScrollable(child: ExamsGradingState());

      case ExamSolveViewMode.failure:
        return _SolveScrollable(
          child: ExamsFailureState(onRetryPressed: () => cubit.refresh()),
        );

      case ExamSolveViewMode.closed:
        return _SolveScrollable(
          child: ExamsClosedState(
            onReturnPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteNames.mainNavigationScreen,
                (route) => false,
              );
            },
          ),
        );

      case ExamSolveViewMode.deleted:
        return _SolveScrollable(
          child: ExamsDeletedState(
            onReturnPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteNames.mainNavigationScreen,
                (route) => false,
              );
            },
          ),
        );

      case ExamSolveViewMode.pendingConnection:
        return _SolveScrollable(
          child: ExamsPendingConnectionState(
            onRetryPressed: () => cubit.retryPendingSubmission(),
            onReturnPressed: () => Navigator.of(context).pop(),
          ),
        );

      case ExamSolveViewMode.resume:
        return _SolveScrollable(
          child: ExamsResumeState(
            onResumePressed: () => cubit.startAttempt(),
            onReturnPressed: () => Navigator.of(context).pop(),
          ),
        );
    }
  }

  Widget _buildSolvingBody(ExamSolveCubit cubit) {
    final question = state.currentQuestion;
    if (question == null) return const SizedBox.shrink();

    return Column(
      children: [
        SolveTimerStrip(remainingStream: cubit.remainingStream),
        verticalSpace(12),
        SolveProgressBand(state: state, onQuestionTap: cubit.goToQuestion),
        verticalSpace(16),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SolveQuestionCard(state: state),
                verticalSpace(16),
                for (
                  int index = 0;
                  index < question.answersText.length;
                  index++
                ) ...[
                  if (index != 0) verticalSpace(10),
                  SolveOptionTile(
                    index: index,
                    text: question.answersText[index],
                    isSelected: question.selectedAnswerIndex == index,
                    onTap: () => cubit.selectAnswer(index),
                  ),
                ],
                verticalSpace(12),
              ],
            ),
          ),
        ),
        verticalSpace(16),
        SolveBottomBar(
          isFirstQuestion: state.isFirstQuestion,
          isLastQuestion: state.isLastQuestion,
          onPreviousPressed: cubit.previousQuestion,
          onNextPressed: cubit.nextQuestion,
          onSubmitPressed: cubit.requestSubmission,
        ),
      ],
    );
  }
}

class _SolveScrollable extends StatelessWidget {
  final Widget child;
  const _SolveScrollable({required this.child});

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
