import 'package:e_nova/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<T, P> {
  Future<Either<Failures, T>> call(P p);
}

class NoParams {
  const NoParams();
}
