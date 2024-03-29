class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  String toString() {
    return message;
  }
}

class RestFailure extends Failure {
  const RestFailure(super.message);
}
