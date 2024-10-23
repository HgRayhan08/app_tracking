import 'package:app_tracking/data/repository/authentication.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

class GetLoggedInUser implements UseCase<Result<String>, void> {
  final Authentication _authentication;

  GetLoggedInUser({
    required Authentication authentication,
  }) : _authentication = authentication;

  @override
  Future<Result<String>> call(void _) async {
    String? loggedId = _authentication.getLoggedInUserId();
    if (loggedId != null) {
      return Result.success(loggedId);
    } else {
      return const Result.failed("No User Longged in");
    }
  }
}
