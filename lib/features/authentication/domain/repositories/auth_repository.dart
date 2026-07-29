import 'package:e_nova/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String conformPassword,
    required bool isCheckedTCandPP,
  });

  Future<Either<Failures, String>> logIn({
    required String email,
    required String password,
  });

  Future<Either<Failures, String>> logOut();

  Future<Either<Failures, String>> forgotPassword({required String email});

  Future<Either<Failures, String>> resetPassword({
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<Failures, String>> sendEmailVerification();

  Future<Either<Failures, String>> isEmailVerified();

  Future<Either<Failures, String>> getCurrentUser();

  Future<Either<Failures, String>> googleSignIn();

  Future<Either<Failures, String>> facebookSignIn();
}
