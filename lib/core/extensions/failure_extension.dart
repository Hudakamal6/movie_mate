import '../error/failure.dart';

extension FailureToMessage on Failure {
  String get toMessage {
    if (this is ServerFailure) {
      final fail = this as ServerFailure;

      return fail.message;
    } else if (this is NetworkFailure) {
      final fail = this as NetworkFailure;

      return fail.message;
    } else {
      return "UnKnown Failure ";
    }
  }
}
