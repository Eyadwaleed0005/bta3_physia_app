import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class StartupSessionRepository {
  Future<Either<AppErrorModel, bool>> hasValidSession();
}
