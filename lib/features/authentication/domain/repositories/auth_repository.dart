import 'package:fpdart/fpdart.dart';

import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/features/authentication/domain/entities/user_entity.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/params/reset_password_params.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, UserEntity>> signUp({SignUpParams signUpParams});

  Future<Either<Failures, UserEntity>> logIn({LogInParams logInParams});

  Future<Either<Failures, String>> logOut();

  Future<Either<Failures, void>> forgotPassword({
    ForgotPasswordParams? forgotPasswordParams,
  });

  Future<Either<Failures, void>> sendResetPassword({
    ResetPasswordParams resetPasswordParams,
  });

  Future<Either<Failures, String>> sendEmailVerification();

  Future<Either<Failures, bool>> isEmailVerified();

  Future<Either<Failures, String>> getCurrentUser();

  Future<Either<Failures, String>> googleSignIn();

  Future<Either<Failures, String>> googleSignOut();

  Future<Either<Failures, String>> facebookSignIn();

  Future<Either<Failures, String>> facebookSignOut();

  Future<Either<Failures, bool>> checkAuthStatus();
}
