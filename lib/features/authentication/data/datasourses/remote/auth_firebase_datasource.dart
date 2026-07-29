// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_nova/core/error/exceptions.dart';
import 'package:e_nova/core/services/firebase_service.dart';
import 'package:e_nova/core/services/firestore_service.dart';
import 'package:e_nova/features/authentication/data/models/user_model.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/params/reset_password_params.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthFirebaseDatasource {
  Future<UserModel> signUp({SignUpParams signUpParams});

  Future<UserModel> logIn({LogInParams logInParams});

  Future<UserModel> logOut();

  Future<UserModel> forgotPassword({ForgotPasswordParams forgotPasswordParams});

  Future<UserModel> resetPassword({ResetPasswordParams resetPasswordParams});

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
    // TODO: implement facebookSignIn
    throw UnimplementedError();
  }

  // --------------------------------------[Facebook Sign Out]------------------------------------------------
  @override
  Future<UserModel> facebookSignOut() {
    // TODO: implement facebookSignOut
    throw UnimplementedError();
  }

  // --------------------------------------[Forgot Password]------------------------------------------------
  @override
  Future<UserModel> forgotPassword({
    ForgotPasswordParams? forgotPasswordParams,
  }) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  // --------------------------------------[Get Current User]------------------------------------------------
  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  // --------------------------------------[Google Sign In]------------------------------------------------
  @override
  Future<UserModel> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  // --------------------------------------[Google Sign Out]------------------------------------------------
  @override
  Future<UserModel> googleSignOut() {
    // TODO: implement googleSignOut
    throw UnimplementedError();
  }

  // --------------------------------------[Is Email Verified]------------------------------------------------
  @override
  Future<bool> isEmailVerified() {
    // TODO: implement isEmailVerified
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
    // TODO: implement logOut
    throw UnimplementedError();
  }

  // --------------------------------------[Reset Password]------------------------------------------------
  @override
  Future<UserModel> resetPassword({ResetPasswordParams? resetPasswordParams}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  // --------------------------------------[Send Email Verification]------------------------------------------------
  @override
  Future<UserModel> sendEmailVerification() {
    // TODO: implement sendEmailVerification
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
