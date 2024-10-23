import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateTrackingParams {
  final LatLng location;
  final String address;
  final LatLng destination;
  final String id;

  CreateTrackingParams({
    required this.location,
    required this.address,
    required this.destination,
    required this.id,
  });
}
