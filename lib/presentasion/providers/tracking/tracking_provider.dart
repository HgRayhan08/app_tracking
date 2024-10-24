import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/create_tracking/create_tracking_params.dart';
import 'package:app_tracking/domain/usecase/get_tracking/get_tracking.dart';
import 'package:app_tracking/domain/usecase/update_location/update_location_params.dart';
import 'package:app_tracking/presentasion/providers/usecase/create_tracking_provider.dart';
import 'package:app_tracking/presentasion/providers/usecase/get_tracking_provider.dart';
import 'package:app_tracking/presentasion/providers/usecase/update_tracking_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../domain/model/tracking_data.dart';

part 'tracking_provider.g.dart';

@Riverpod(keepAlive: true)
class Tracking extends _$Tracking {
  @override
  FutureOr<String> build() {
    return "";
  }

  late GoogleMapController mapController;
  late LatLng newLocation;

  late final Set<Marker> markers = {};

  geo.Placemark? placemark;

  // bool isUpdate = false;
  // bool isStart = false;

  void onLongPressGoogleMap(LatLng latLng) async {
    newLocation = latLng;
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    placemark = place;

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  Future<void> onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    placemark = place;

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    markers.clear();
    markers.add(marker);
  }

  Future<bool> createTracking({
    required LatLng location,
    required String address,
    required LatLng destination,
    required String id,
  }) async {
    var create = ref.read(createTrackingProvider);
    var result = await create(CreateTrackingParams(
        location: location,
        address: address,
        destination: destination,
        id: id));
    if (result.isSuccess) {
      // isStart = true;
      // isUpdate = true;
      return true;
    } else {
      return false;
    }
  }

  Future<List<TrackingData>> getAllTracking() async {
    GetTracking getData = ref.read(getTrackingProvider);
    var result = await getData(null);
    if (result case Success(value: final data)) {
      return data;
    } else {
      return [];
    }
  }

  Future<bool> updateTracking({
    required String id,
    required LatLng location,
  }) async {
    print("Update Berjalan");
    var update = ref.read(updateLocationProvider);
    var result =
        await update(UpdatdateLocationParams(id: id, location: location));
    if (result.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
