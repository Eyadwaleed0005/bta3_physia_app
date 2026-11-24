import '../errors/cache_error_model.dart';

abstract final class CacheErrorHandler {
  static CacheErrorModel handle(CacheErrorType type) {
    final message = switch (type) {
      CacheErrorType.readFailed => 'تعذّر قراءة البيانات المحفوظة.',
      CacheErrorType.writeFailed => 'تعذّر حفظ البيانات.',
    };

    return CacheErrorModel(type: type, message: message);
  }
}
