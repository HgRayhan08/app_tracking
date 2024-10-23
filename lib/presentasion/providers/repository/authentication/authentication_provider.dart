import 'package:app_tracking/data/firebase/firebase_authentication.dart';
import 'package:app_tracking/data/repository/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) =>
    FirebaseAuthenticatioan();
