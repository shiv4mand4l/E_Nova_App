import 'package:e_nova/core/error/failures.dart';
import 'package:e_nova/core/usecases/usecase.dart';
import 'package:e_nova/features/authentication/domain/repositories/auth_repository.dart';
import 'package:e_nova/features/authentication/params/reset_password_params.dart';
import 'package:fpdart/fpdart.dart';

class ResetPasswordUsecase implements Usecase<void, ResetPasswordParams> {
  final AuthRepository authRepository;

  ResetPasswordUsecase(this.authRepository);
  @override
  Future<Either<Failures, void>> call(ResetPasswordParams p) async {
    return await authRepository.sendResetPassword(
      resetPasswordParams: ResetPasswordParams(
        code: p.code,
        newPassword: p.newPassword,
      ),
    );
  }
}
