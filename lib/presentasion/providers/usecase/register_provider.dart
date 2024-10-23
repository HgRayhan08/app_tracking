import 'package:app_tracking/domain/usecase/register/register.dart';
import 'package:app_tracking/presentasion/providers/repository/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) =>
    Register(authentication: ref.watch(authenticationProvider));
