import 'package:app_tracking/domain/usecase/get_logged_in_user/get_logged_in_user.dart';
import 'package:app_tracking/presentasion/providers/repository/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_login_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) =>
    GetLoggedInUser(authentication: ref.watch(authenticationProvider));
