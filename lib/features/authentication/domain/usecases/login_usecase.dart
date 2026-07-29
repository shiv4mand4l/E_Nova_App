import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/core/usecases/usecase.dart';
import 'package:e_nova/features/authentication/domain/entities/user_entity.dart';
import 'package:e_nova/features/authentication/domain/repositories/auth_repository.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:fpdart/fpdart.dart';

class LoginUsecase implements Usecase<UserEntity, LogInParams> {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);
  @override
  Future<Either<Failures, UserEntity>> call(LogInParams p) async {
    return await authRepository.logIn(
      logInParams: LogInParams(email: p.email, password: p.password),
    );
  }
}
