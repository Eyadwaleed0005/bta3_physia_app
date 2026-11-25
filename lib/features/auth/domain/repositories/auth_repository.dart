import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/login_entity.dart';
import '../entities/register_entity.dart';

abstract interface class AuthRepository {
  Future<Either<AppErrorModel, Unit>> login(LoginEntity entity);

  Future<Either<AppErrorModel, Unit>> register(RegisterEntity entity);
}
