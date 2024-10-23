import 'package:app_tracking/data/repository/authentication.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;
  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}
