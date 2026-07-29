import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<T, P> {
  Future<Either<Exception, T>> call();
}

class NoParams {
  const NoParams();
}
