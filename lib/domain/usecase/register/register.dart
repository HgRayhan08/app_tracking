import 'package:app_tracking/data/repository/authentication.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/register/register_param.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

class Register implements UseCase<Result<String>, Registerparam> {
  final Authentication _authentication;

  Register({
    required Authentication authentication,
  }) : _authentication = authentication;

  @override
  Future<Result<String>> call(Registerparam params) async {
    var uiResult = await _authentication.register(
        email: params.email, password: params.password);
    if (uiResult.isSuccess) {
      return Result.success(uiResult.resultValue.toString());
    } else {
      return Result.failed(uiResult.errorMessage!);
    }
  }
}
