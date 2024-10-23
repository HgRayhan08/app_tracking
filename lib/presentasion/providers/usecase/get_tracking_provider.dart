import 'package:app_tracking/domain/usecase/get_tracking/get_tracking.dart';
import 'package:app_tracking/presentasion/providers/repository/realtime_database/realtime_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_tracking_provider.g.dart";

@riverpod
GetTracking getTracking(GetTrackingRef ref) =>
    GetTracking(realtimeDatabase: ref.watch(realtimeDatabaseProvider));
