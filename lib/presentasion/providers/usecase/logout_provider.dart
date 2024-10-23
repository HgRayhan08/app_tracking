import 'package:app_tracking/domain/usecase/logout/logout.dart';
import 'package:app_tracking/presentasion/providers/repository/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) =>
    Logout(authentication: ref.watch(authenticationProvider));
