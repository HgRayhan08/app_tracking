import 'package:app_tracking/data/firebase/firebase_realtime_database.dart';
import 'package:app_tracking/data/repository/realtime_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'realtime_database_provider.g.dart';

@riverpod
RealtimeDatabase realtimeDatabase(RealtimeDatabaseRef ref) =>
    FirebaseRealtimeDatabase();
