import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  const LoginUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<Either<AppErrorModel, Unit>> call(LoginEntity entity) {
    return _authRepository.login(entity);
  }
}
