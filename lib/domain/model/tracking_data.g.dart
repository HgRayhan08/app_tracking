// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingDataImpl _$$TrackingDataImplFromJson(Map<String, dynamic> json) =>
    _$TrackingDataImpl(
      location:
          LocationTracking.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] as String,
      destination: LocationTracking.fromJson(
          json['destination'] as Map<String, dynamic>),
      updateTime: json['updateTime'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$TrackingDataImplToJson(_$TrackingDataImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'address': instance.address,
      'destination': instance.destination,
      'updateTime': instance.updateTime,
      'timestamp': instance.timestamp,
    };

_$LocationTrackingImpl _$$LocationTrackingImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationTrackingImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationTrackingImplToJson(
        _$LocationTrackingImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
