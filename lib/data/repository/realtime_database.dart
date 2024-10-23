import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/model/tracking_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract interface class RealtimeDatabase {
  Future<Result<bool>> createTracking({
    required LatLng location,
    required String address,
    required LatLng destination,
    required String id,
  });
  Future<Result<bool>> updateLocation({
    required String id,
    required LatLng location,
    required String updateTime,
  });

  Future<Result<List<TrackingData>>> getAllTracking();
}
