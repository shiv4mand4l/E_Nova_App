import 'package:fpdart/fpdart.dart';

abstract interface class SignupUsecase {
  Future<Either<Exception, String>> signUp();
}
