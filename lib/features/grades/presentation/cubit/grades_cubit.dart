import 'dart:async';

import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/grade_entity.dart';
import '../../domain/use_cases/stream_grades_use_case.dart';
import 'grades_state.dart';

class GradesCubit extends Cubit<GradesState> {
  GradesCubit({required this._streamGradesUseCase})
    : super(const GradesInitial());

  final StreamGradesUseCase _streamGradesUseCase;
  StreamSubscription<Either<AppErrorModel, List<GradeEntity>>>? _subscription;
  bool _isClosing = false;

  Future<void> loadGrades() async {
    if (_isClosing || isClosed || state is GradesLoading) return;

    emit(const GradesLoading());
    await _subscription?.cancel();

    if (_isClosing || isClosed) return;

    _subscription = _streamGradesUseCase().listen((result) {
      if (_isClosing || isClosed) return;

      result.fold(
        (error) => emit(GradesFailure(error)),
        (grades) =>
            emit(grades.isEmpty ? const GradesEmpty() : GradesLoaded(grades)),
      );
    });
  }

  @override
  Future<void> close() async {
    _isClosing = true;
    await _subscription?.cancel();
    await super.close();
  }
}
