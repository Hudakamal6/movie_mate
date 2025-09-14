class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

class DioFailure extends Failure {
  const DioFailure()
      : super('There is Internal Error Right Now Please Try Again Later');
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
