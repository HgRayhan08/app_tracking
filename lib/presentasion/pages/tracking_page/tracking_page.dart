import 'package:app_tracking/presentasion/providers/location/location_provider.dart';
import 'package:app_tracking/presentasion/providers/router/router_provider.dart';
import 'package:app_tracking/presentasion/providers/tracking/tracking_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:cron/cron.dart';

class TrackingPage extends ConsumerStatefulWidget {
  const TrackingPage({super.key});

  @override
  ConsumerState<TrackingPage> createState() => _TrackingPageState();
}

final DatabaseReference dbRef = FirebaseDatabase.instance.ref("Tracking");

class _TrackingPageState extends ConsumerState<TrackingPage> {
  var uuid = const Uuid();
  String? newId;
  bool? isUpdate = false;
  bool? isStart = false;
  LatLng? destinationLocation;
  String? lokasi;
  late GoogleMapController mapController;
  final Cron _cron = Cron();
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _startLocationUpdates(); // Memulai pengiriman data lokasi setiap 2 menit
  }

  @override
  void dispose() {
    _cron.close(); // Menghentikan cron ketika halaman ditutup
    super.dispose();
  }

  Future<void> _startLocationUpdates() async {
    // Permintaan akses lokasi
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return; // Berhenti jika permission ditolak
    }

    // Mulai cron job untuk update lokasi setiap 2 menit
    _cron.schedule(Schedule.parse('*/2 * * * *'), () async {
      try {
        _currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        if (isUpdate == true && _currentPosition != null) {
          ref.watch(trackingProvider.notifier).updateTracking(
                id: newId.toString(),
                location: LatLng(
                    _currentPosition!.latitude, _currentPosition!.longitude),
              );
        }

        setState(() {}); // Update UI jika perlu
      } catch (e) {
        print("Error getting location: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("history");
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            ref.watch(locationProviderProvider.notifier).getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dataLocation = snapshot.data!;
            return Stack(
              children: [
                GoogleMap(
                  markers: {
                    destinationLocation != null
                        ? Marker(
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen),
                            markerId: const MarkerId("Location A"),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.newLatLngZoom(
                                    LatLng(destinationLocation!.latitude,
                                        destinationLocation!.longitude),
                                    18),
                              );
                            },
                            position: LatLng(destinationLocation!.latitude,
                                destinationLocation!.longitude),
                            infoWindow: const InfoWindow(
                              title: " Tujuan",
                            ),
                          )
                        : const Marker(markerId: MarkerId("Kosong")),
                    Marker(
                      markerId: const MarkerId("location B"),
                      onTap: () {
                        mapController.animateCamera(
                          CameraUpdate.newLatLngZoom(
                              LatLng(
                                dataLocation.latitude,
                                dataLocation.longitude,
                              ),
                              18),
                        );
                      },
                      position: LatLng(
                        dataLocation.latitude,
                        dataLocation.longitude,
                      ),
                      infoWindow: const InfoWindow(
                        title: "Lokasi Saat Ini",
                        // snippet: "${widget.lat}, ${widget.long}"
                      ),
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    zoom: 18,
                    target: LatLng(
                      dataLocation.latitude,
                      dataLocation.longitude,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.01,
                  ),
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(destinationLocation == null
                              ? "Pilih Lokasi"
                              : lokasi ?? "lokasi belum ditemukan"),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width * 0.2, height * 0.01),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: const Color(0xff7BD3EA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                LatLng? result = await ref
                                    .read(routerProvider)
                                    .pushNamed("destination");
                                if (result != null) {
                                  destinationLocation = result;

                                  final info =
                                      await geo.placemarkFromCoordinates(
                                          result.latitude, result.longitude);

                                  final place = info[0];
                                  lokasi = place.locality;

                                  setState(() {});
                                } else {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Terjadi Error"),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Tujuan",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      isStart == false
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width * 0.2, height * 0.01),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: Colors.green[600],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                if (lokasi == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Mohon Masukkan Tujuan"),
                                    ),
                                  );
                                } else {
                                  print("start");
                                  newId = uuid.v1();
                                  await ref
                                      .read(trackingProvider.notifier)
                                      .createTracking(
                                        location: LatLng(dataLocation.latitude,
                                            dataLocation.longitude),
                                        address: lokasi!,
                                        destination: destinationLocation!,
                                        id: newId!,
                                      );
                                  isStart = true;
                                  isUpdate = true;
                                  print(isUpdate);
                                  setState(() {});
                                  print("coba");
                                }
                              },
                              child: const Text(
                                "Start",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width * 0.2, height * 0.01),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                destinationLocation = null;
                                lokasi = null;
                                isStart = false;
                                isUpdate = false;
                                setState(() {});
                              },
                              child: const Text(
                                "Stop",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Loading ..."),
            );
          }
        },
      ),
    );
  }
}
