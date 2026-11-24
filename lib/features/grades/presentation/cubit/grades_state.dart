import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';

import '../../domain/entities/grade_entity.dart';

sealed class GradesState {
  const GradesState();
}

final class GradesInitial extends GradesState {
  const GradesInitial();
}

final class GradesLoading extends GradesState {
  const GradesLoading();
}

final class GradesLoaded extends GradesState {
  const GradesLoaded(this.grades);

  final List<GradeEntity> grades;
}

final class GradesEmpty extends GradesState {
  const GradesEmpty();
}

final class GradesFailure extends GradesState {
  const GradesFailure(this.error);

  final AppErrorModel error;
}
