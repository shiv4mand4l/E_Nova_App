import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/core/usecases/usecase.dart';
import 'package:e_nova/features/authentication/domain/entities/user_entity.dart';
import 'package:e_nova/features/authentication/domain/repositories/auth_repository.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';
import 'package:fpdart/fpdart.dart';

class SignupUsecase implements Usecase<UserEntity, SignUpParams> {
  final AuthRepository authRepository;

  SignupUsecase(this.authRepository);
  @override
  Future<Either<Failures, UserEntity>> call(SignUpParams p) async {
    return await authRepository.signUp(
      signUpParams: SignUpParams(
        firstName: p.firstName,
        lastName: p.lastName,
        email: p.email,
        password: p.password,
        confirmPassword: p.confirmPassword,
      ),
    );
  }
}
