import 'package:app_tracking/data/repository/authentication.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

part 'Login_params.dart';

class Login implements UseCase<Result<String>, LoginParams> {
  final Authentication authentication;
  Login({required this.authentication});

  @override
  Future<Result<String>> call(LoginParams params) async {
    var idResult = await authentication.login(
      email: params.email,
      password: params.password,
    );

    if (idResult is Success) {
      return Result.success(idResult.resultValue.toString());
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
