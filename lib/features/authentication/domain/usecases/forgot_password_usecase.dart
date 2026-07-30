import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/core/usecases/usecase.dart';
import 'package:e_nova/features/authentication/domain/repositories/auth_repository.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:fpdart/fpdart.dart';

class ForgotPasswordUsecase implements Usecase<void, ForgotPasswordParams> {
  final AuthRepository authRepository;

  ForgotPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failures, void>> call(ForgotPasswordParams p) async {
    return await authRepository.forgotPassword(
      forgotPasswordParams: ForgotPasswordParams(email: p.email),
    );
  }
}
