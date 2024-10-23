import 'package:app_tracking/presentasion/providers/location/location_provider.dart';
import 'package:app_tracking/presentasion/providers/router/router_provider.dart';
import 'package:app_tracking/presentasion/providers/tracking/tracking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DestinationPage extends ConsumerStatefulWidget {
  const DestinationPage({super.key});

  @override
  ConsumerState<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends ConsumerState<DestinationPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref
                .read(routerProvider)
                .pop(ref.read(trackingProvider.notifier).newLocation);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
          future:
              ref.watch(locationProviderProvider.notifier).getCurrentLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return Center(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        zoom: 18,
                        target: LatLng(data.latitude, data.longitude),
                      ),
                      markers: ref.read(trackingProvider.notifier).markers,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      onMapCreated: (controller) async {
                        final info = await geo.placemarkFromCoordinates(
                            data.latitude, data.longitude);

                        final place = info[0];
                        final street = place.street!;
                        final address =
                            '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                        setState(() {
                          ref.watch(trackingProvider.notifier).placemark =
                              place;
                        });

                        ref.read(trackingProvider.notifier).defineMarker(
                            LatLng(data.latitude, data.longitude),
                            street,
                            address);

                        setState(() {
                          // ref.read(trackingProvider.notifier).mapController =
                          controller;
                        });
                      },
                      onLongPress: (LatLng latLng) => ref
                          .read(trackingProvider.notifier)
                          .onLongPressGoogleMap(latLng),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: FloatingActionButton(
                          child: const Icon(Icons.my_location),
                          onPressed: () {
                            ref
                                .read(trackingProvider.notifier)
                                .onMyLocationButtonPress();
                            setState(() {});
                          }),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("Loading ..."),
              );
            }
          }),
    );
  }
}
