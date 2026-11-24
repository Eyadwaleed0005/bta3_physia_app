import 'package:bta3_physia/core/cache/errors/cache_error_model.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepository {
  Future<Either<CacheErrorModel, bool>> isCompleted();

  Future<Either<CacheErrorModel, Unit>> markCompleted();
}
