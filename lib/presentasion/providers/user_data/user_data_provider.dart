import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/get_logged_in_user/get_logged_in_user.dart';
import 'package:app_tracking/domain/usecase/login/login.dart';
import 'package:app_tracking/domain/usecase/register/register.dart';
import 'package:app_tracking/domain/usecase/register/register_param.dart';
import 'package:app_tracking/presentasion/providers/usecase/get_login_user_provider.dart';
import 'package:app_tracking/presentasion/providers/usecase/login_provider.dart';
import 'package:app_tracking/presentasion/providers/usecase/logout_provider.dart';
import 'package:app_tracking/presentasion/providers/usecase/register_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<String?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var userResult = await getLoggedInUser(null);

    if (userResult.isSuccess) {
      return userResult.resultValue;
    } else {
      return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    Login login = ref.read(loginProvider);
    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<bool> registrasi({
    required String email,
    required String password,
  }) async {
    Register register = ref.read(registerProvider);
    var result = register(Registerparam(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
        return true;
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
        return false;
    }
    return false;
  }

  Future<void> logout() async {
    var logout = ref.read(logoutProvider);
    var result = await logout(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }
}
