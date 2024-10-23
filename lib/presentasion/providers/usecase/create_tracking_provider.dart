import 'package:app_tracking/domain/usecase/create_tracking/create_tracking.dart';
import 'package:app_tracking/presentasion/providers/repository/realtime_database/realtime_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_tracking_provider.g.dart';

@riverpod
CreateTracking createTracking(CreateTrackingRef ref) =>
    CreateTracking(realtimeDatabase: ref.watch(realtimeDatabaseProvider));
