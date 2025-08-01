// lib/core/error/failures.dart

abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

// Example concrete failures
class ServerFailure extends Failure {
  ServerFailure([super.message = 'Server Failure']);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = 'Cache Failure']);
}

class NotFoundFailure extends Failure {
  NotFoundFailure([super.message = 'Item not found']);
}
