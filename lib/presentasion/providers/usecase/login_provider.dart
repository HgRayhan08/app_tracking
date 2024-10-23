import 'package:app_tracking/domain/usecase/login/login.dart';
import 'package:app_tracking/presentasion/providers/repository/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) =>
    Login(authentication: ref.watch(authenticationProvider));
