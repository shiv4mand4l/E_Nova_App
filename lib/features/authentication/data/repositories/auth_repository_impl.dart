import 'package:fpdart/fpdart.dart';

import 'package:e_nova/core/error/exceptions.dart';
import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/features/authentication/data/datasourses/remote/auth_firebase_datasource.dart';
import 'package:e_nova/features/authentication/domain/entities/user_entity.dart';
import 'package:e_nova/features/authentication/domain/repositories/auth_repository.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/params/reset_password_params.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDatasource authFirebaseDatasource;

  AuthRepositoryImpl(this.authFirebaseDatasource);

  @override
  Future<Either<Failures, bool>> checkAuthStatus() async {
    try {
      final isLoggedIn = await authFirebaseDatasource.checkAuthStatus();
      return Right(isLoggedIn);
    } on ServerException catch (e) {
      return Left(Failures(e.message));
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> facebookSignIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> facebookSignOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> forgotPassword({
    ForgotPasswordParams? forgotPasswordParams,
  }) async {
    try {
      await authFirebaseDatasource.forgotPassword(
        forgotPasswordParams: ForgotPasswordParams(
          email: forgotPasswordParams!.email,
        ),
      );

      return const Right('Email sent successfully');
    } on ServerException catch (e) {
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, String>> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> googleSignIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> googleSignOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, bool>> isEmailVerified() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, UserEntity>> logIn({LogInParams? logInParams}) async {
    try {
      final user = await authFirebaseDatasource.logIn(
        logInParams: LogInParams(
          email: logInParams!.email,
          password: logInParams.password,
        ),
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, String>> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, void>> sendResetPassword({
    ResetPasswordParams? resetPasswordParams,
  }) async {
    // try {
    //   await authFirebaseDatasource.sendResetPassword(
    //     resetPasswordParams: ResetPasswordParams(
    //       code: resetPasswordParams!.code,
    //       newPassword: resetPasswordParams.newPassword,
    //     ),
    //   );

    //   // ignore: void_checks
    //   return const Right('Successfully Reset');
    // } on ServerException catch (e) {
    //   return Left(Failures(e.message));
    // }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> sendEmailVerification() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, UserEntity>> signUp({
    SignUpParams? signUpParams,
  }) async {
    try {
      final user = await authFirebaseDatasource.signUp(
        signUpParams: SignUpParams(
          firstName: signUpParams!.firstName,
          lastName: signUpParams.lastName,
          email: signUpParams.email,
          password: signUpParams.password,
          confirmPassword: signUpParams.confirmPassword,
        ),
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(Failures(e.message));
    }
  }
}
