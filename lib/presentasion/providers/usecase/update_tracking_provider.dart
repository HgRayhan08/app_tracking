import 'package:app_tracking/domain/usecase/update_location/update_location.dart';
import 'package:app_tracking/presentasion/providers/repository/realtime_database/realtime_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_tracking_provider.g.dart';

@riverpod
UpdateLocation updateLocation(UpdateLocationRef ref) =>
    UpdateLocation(realtimeDatabase: ref.watch(realtimeDatabaseProvider));
