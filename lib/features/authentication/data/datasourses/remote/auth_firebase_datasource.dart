import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import 'package:e_nova/core/error/exceptions.dart';
import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/core/services/firebase_service.dart';
import 'package:e_nova/core/services/firestore_service.dart';
import 'package:e_nova/features/authentication/data/models/user_model.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/params/reset_password_params.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';

abstract interface class AuthFirebaseDatasource {
  Future<UserModel> signUp({SignUpParams signUpParams});

  Future<UserModel> logIn({LogInParams logInParams});

  Future<UserModel> logOut();

  Future<void> forgotPassword({ForgotPasswordParams forgotPasswordParams});

  Future<void> sendResetPassword({ResetPasswordParams resetPasswordParams});

  Future<UserModel> sendEmailVerification();

  Future<bool> isEmailVerified();

  Future<UserModel> getCurrentUser();

  Future<UserModel> googleSignIn();

  Future<UserModel> googleSignOut();

  Future<UserModel> facebookSignIn();

  Future<UserModel> facebookSignOut();

  Future<bool> checkAuthStatus();
}

// --------------------------------------[Firebase Implimentation]------------------------------------------------
class AuthFirebaseDatasourceImpl implements AuthFirebaseDatasource {
  final FirebaseService firebaseService;
  final FirestoreService firestoreService;

  AuthFirebaseDatasourceImpl(this.firebaseService, this.firestoreService);

  // --------------------------------------[Check Authentication Status]------------------------------------------------
  @override
  Future<bool> checkAuthStatus() async {
    return firebaseService.auth.currentUser != null;
  }

  // --------------------------------------[Facebook Sign In]------------------------------------------------
  @override
  Future<UserModel> facebookSignIn() {
    throw UnimplementedError();
  }

  // --------------------------------------[Facebook Sign Out]------------------------------------------------
  @override
  Future<UserModel> facebookSignOut() {
    throw UnimplementedError();
  }

  // --------------------------------------[Forgot Password]------------------------------------------------
  @override
  Future<void> forgotPassword({
    ForgotPasswordParams? forgotPasswordParams,
  }) async {
    try {
      await firebaseService.auth.sendPasswordResetEmail(
        email: forgotPasswordParams!.email.trim(),
      );
    } on FirebaseException catch (e) {
      Left(e.message);
    } on ServerException catch (e) {
      Left(Failures(e.message));
    }
  }

  // --------------------------------------[Get Current User]------------------------------------------------
  @override
  Future<UserModel> getCurrentUser() {
    throw UnimplementedError();
  }

  // --------------------------------------[Google Sign In]------------------------------------------------
  @override
  Future<UserModel> googleSignIn() {
    throw UnimplementedError();
  }

  // --------------------------------------[Google Sign Out]------------------------------------------------
  @override
  Future<UserModel> googleSignOut() {
    throw UnimplementedError();
  }

  // --------------------------------------[Is Email Verified]------------------------------------------------
  @override
  Future<bool> isEmailVerified() {
    throw UnimplementedError();
  }

  // --------------------------------------[Log In]------------------------------------------------
  @override
  Future<UserModel> logIn({LogInParams? logInParams}) async {
    try {
      final userCredential = await firebaseService.auth
          .signInWithEmailAndPassword(
            email: logInParams!.email.trim(),
            password: logInParams.password.trim(),
          );

      final user = userCredential.user;

      if (user == null) {
        throw ServerException('User not found!');
      }

      final doc = await firestoreService.firebaseFirestore
          .collection('user')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        throw ServerException('User data not found!');
      }
      return UserModel.fromJson(doc.data()!);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Log In Failed';
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // --------------------------------------[Log Out]------------------------------------------------
  @override
  Future<UserModel> logOut() {
    throw UnimplementedError();
  }

  // --------------------------------------[Reset Password]------------------------------------------------
  @override
  Future<void> sendResetPassword({
    ResetPasswordParams? resetPasswordParams,
  }) async {
    // try {
    //   await firebaseService.auth.confirmPasswordReset(
    //     code: resetPasswordParams!.code,
    //     newPassword: resetPasswordParams.newPassword,
    //   );
    // } on FirebaseAuthException catch (e) {
    //   throw e.message ?? 'Error while sendind...';
    // } on ServerException catch (e) {
    //   throw ServerException(e.message);
    // }
    throw UnimplementedError();
  }

  // --------------------------------------[Send Email Verification]------------------------------------------------
  @override
  Future<UserModel> sendEmailVerification() {
    throw UnimplementedError();
  }

  // --------------------------------------[Sign Up]------------------------------------------------

  @override
  Future<UserModel> signUp({SignUpParams? signUpParams}) async {
    try {
      // --------[For Creating a user from their email and password]-------------------------

      if (signUpParams?.password != signUpParams?.confirmPassword) {
        throw ServerException("Passwords do not match");
      }

      final userCredential = await firebaseService.auth
          .createUserWithEmailAndPassword(
            email: signUpParams!.email.trim(),
            password: signUpParams.password.trim(),
          );

      if (userCredential.user == null) {
        throw ServerException('User Creation Failed...');
      }

      final userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: signUpParams.firstName,
        lastName: signUpParams.lastName,
        email: signUpParams.email,
        password: signUpParams.password,
        confirmPassword: signUpParams.confirmPassword,
      );

      // ---------------[Storing an user's data while creating]---------------------------------
      await firestoreService.firebaseFirestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      final doc = await firestoreService.firebaseFirestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .get();

      return UserModel.fromJson(doc.data()!);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'SignUp Failed!';
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
