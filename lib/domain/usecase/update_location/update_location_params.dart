import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdatdateLocationParams {
  final String id;
  final LatLng location;

  UpdatdateLocationParams({required this.id, required this.location});
}
