enum CacheErrorType { readFailed, writeFailed }

class CacheErrorModel {
  const CacheErrorModel({required this.type, required this.message});

  final CacheErrorType type;
  final String message;
}
