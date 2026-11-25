import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/startup_session_repository.dart';

class CheckSavedSession {
  const CheckSavedSession(this._repository);

  final StartupSessionRepository _repository;

  Future<Either<AppErrorModel, bool>> call() {
    return _repository.hasValidSession();
  }
}
