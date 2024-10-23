// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackingData _$TrackingDataFromJson(Map<String, dynamic> json) {
  return _TrackingData.fromJson(json);
}

/// @nodoc
mixin _$TrackingData {
  LocationTracking get location => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  LocationTracking get destination => throw _privateConstructorUsedError;
  String get updateTime => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TrackingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingDataCopyWith<TrackingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingDataCopyWith<$Res> {
  factory $TrackingDataCopyWith(
          TrackingData value, $Res Function(TrackingData) then) =
      _$TrackingDataCopyWithImpl<$Res, TrackingData>;
  @useResult
  $Res call(
      {LocationTracking location,
      String address,
      LocationTracking destination,
      String updateTime,
      String timestamp});

  $LocationTrackingCopyWith<$Res> get location;
  $LocationTrackingCopyWith<$Res> get destination;
}

/// @nodoc
class _$TrackingDataCopyWithImpl<$Res, $Val extends TrackingData>
    implements $TrackingDataCopyWith<$Res> {
  _$TrackingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? address = null,
    Object? destination = null,
    Object? updateTime = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationTracking,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LocationTracking,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationTrackingCopyWith<$Res> get location {
    return $LocationTrackingCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationTrackingCopyWith<$Res> get destination {
    return $LocationTrackingCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackingDataImplCopyWith<$Res>
    implements $TrackingDataCopyWith<$Res> {
  factory _$$TrackingDataImplCopyWith(
          _$TrackingDataImpl value, $Res Function(_$TrackingDataImpl) then) =
      __$$TrackingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocationTracking location,
      String address,
      LocationTracking destination,
      String updateTime,
      String timestamp});

  @override
  $LocationTrackingCopyWith<$Res> get location;
  @override
  $LocationTrackingCopyWith<$Res> get destination;
}

/// @nodoc
class __$$TrackingDataImplCopyWithImpl<$Res>
    extends _$TrackingDataCopyWithImpl<$Res, _$TrackingDataImpl>
    implements _$$TrackingDataImplCopyWith<$Res> {
  __$$TrackingDataImplCopyWithImpl(
      _$TrackingDataImpl _value, $Res Function(_$TrackingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? address = null,
    Object? destination = null,
    Object? updateTime = null,
    Object? timestamp = null,
  }) {
    return _then(_$TrackingDataImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationTracking,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LocationTracking,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingDataImpl implements _TrackingData {
  _$TrackingDataImpl(
      {required this.location,
      required this.address,
      required this.destination,
      required this.updateTime,
      required this.timestamp});

  factory _$TrackingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingDataImplFromJson(json);

  @override
  final LocationTracking location;
  @override
  final String address;
  @override
  final LocationTracking destination;
  @override
  final String updateTime;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'TrackingData(location: $location, address: $address, destination: $destination, updateTime: $updateTime, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingDataImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, location, address, destination, updateTime, timestamp);

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingDataImplCopyWith<_$TrackingDataImpl> get copyWith =>
      __$$TrackingDataImplCopyWithImpl<_$TrackingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingDataImplToJson(
      this,
    );
  }
}

abstract class _TrackingData implements TrackingData {
  factory _TrackingData(
      {required final LocationTracking location,
      required final String address,
      required final LocationTracking destination,
      required final String updateTime,
      required final String timestamp}) = _$TrackingDataImpl;

  factory _TrackingData.fromJson(Map<String, dynamic> json) =
      _$TrackingDataImpl.fromJson;

  @override
  LocationTracking get location;
  @override
  String get address;
  @override
  LocationTracking get destination;
  @override
  String get updateTime;
  @override
  String get timestamp;

  /// Create a copy of TrackingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingDataImplCopyWith<_$TrackingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationTracking _$LocationTrackingFromJson(Map<String, dynamic> json) {
  return _LocationTracking.fromJson(json);
}

/// @nodoc
mixin _$LocationTracking {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this LocationTracking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationTrackingCopyWith<LocationTracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationTrackingCopyWith<$Res> {
  factory $LocationTrackingCopyWith(
          LocationTracking value, $Res Function(LocationTracking) then) =
      _$LocationTrackingCopyWithImpl<$Res, LocationTracking>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LocationTrackingCopyWithImpl<$Res, $Val extends LocationTracking>
    implements $LocationTrackingCopyWith<$Res> {
  _$LocationTrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationTrackingImplCopyWith<$Res>
    implements $LocationTrackingCopyWith<$Res> {
  factory _$$LocationTrackingImplCopyWith(_$LocationTrackingImpl value,
          $Res Function(_$LocationTrackingImpl) then) =
      __$$LocationTrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$LocationTrackingImplCopyWithImpl<$Res>
    extends _$LocationTrackingCopyWithImpl<$Res, _$LocationTrackingImpl>
    implements _$$LocationTrackingImplCopyWith<$Res> {
  __$$LocationTrackingImplCopyWithImpl(_$LocationTrackingImpl _value,
      $Res Function(_$LocationTrackingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationTrackingImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationTrackingImpl implements _LocationTracking {
  _$LocationTrackingImpl({required this.latitude, required this.longitude});

  factory _$LocationTrackingImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationTrackingImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LocationTracking(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationTrackingImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of LocationTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationTrackingImplCopyWith<_$LocationTrackingImpl> get copyWith =>
      __$$LocationTrackingImplCopyWithImpl<_$LocationTrackingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationTrackingImplToJson(
      this,
    );
  }
}

abstract class _LocationTracking implements LocationTracking {
  factory _LocationTracking(
      {required final double latitude,
      required final double longitude}) = _$LocationTrackingImpl;

  factory _LocationTracking.fromJson(Map<String, dynamic> json) =
      _$LocationTrackingImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of LocationTracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationTrackingImplCopyWith<_$LocationTrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
