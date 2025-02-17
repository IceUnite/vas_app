abstract class Failure {
  final List properties;
  Failure([this.properties = const<dynamic>[]]);

  @override
  String toString() => '$runtimeType(${properties.join(', ')})';
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message): super([message]);
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure(this.message): super([message]);
}
