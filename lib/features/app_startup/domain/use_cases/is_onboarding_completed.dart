import 'package:bta3_physia/core/cache/errors/cache_error_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/onboarding_repository.dart';

class IsOnboardingCompleted {
  const IsOnboardingCompleted(this._repository);

  final OnboardingRepository _repository;

  Future<Either<CacheErrorModel, bool>> call() => _repository.isCompleted();
}
