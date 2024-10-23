import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'tracking_data.freezed.dart';
part 'tracking_data.g.dart';

@freezed
class TrackingData with _$TrackingData {
  factory TrackingData({
    required LocationTracking location,
    required String address,
    required LocationTracking destination,
    required String updateTime,
    required String timestamp,
  }) = _TrackingData;

  factory TrackingData.fromJson(Map<String, dynamic> json) =>
      _$TrackingDataFromJson(json);
}

@freezed
class LocationTracking with _$LocationTracking {
  factory LocationTracking({
    required double latitude,
    required double longitude,
  }) = _LocationTracking;

  factory LocationTracking.fromJson(Map<String, dynamic> json) =>
      _$LocationTrackingFromJson(json);
}
