import 'package:bta3_physia/core/cache/errors/cache_error_handler.dart';
import 'package:bta3_physia/core/cache/errors/cache_error_model.dart';
import 'package:bta3_physia/features/app_startup/data/data_sources/cache/onboarding_cache.dart';
import 'package:bta3_physia/features/app_startup/domain/repositories/onboarding_repository.dart';
import 'package:dartz/dartz.dart';


class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this._cache);

  final OnboardingCache _cache;

  @override
  Future<Either<CacheErrorModel, bool>> isCompleted() async {
    try {
      final completed = await _cache.isCompleted();
      return Right(completed);
    } catch (_) {
      return Left(CacheErrorHandler.handle(CacheErrorType.readFailed));
    }
  }

  @override
  Future<Either<CacheErrorModel, Unit>> markCompleted() async {
    try {
      await _cache.markCompleted();
      return Right(unit);
    } catch (_) {
      return Left(CacheErrorHandler.handle(CacheErrorType.writeFailed));
    }
  }
}