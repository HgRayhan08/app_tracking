import 'package:app_tracking/data/repository/realtime_database.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/model/tracking_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class FirebaseRealtimeDatabase implements RealtimeDatabase {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref("Tracking");
  @override
  Future<Result<bool>> createTracking({
    required LatLng location,
    required String address,
    required LatLng destination,
    required String id,
  }) async {
    Map<String, dynamic> data = {
      "location": {
        "latitude": location.latitude,
        "longitude": location.longitude,
      },
      "destination": {
        "latitude": destination.latitude,
        "longitude": destination.longitude,
      },
      "address": address,
      "timestamp": DateTime.now().toIso8601String(),
      "updateTime": DateTime.now().toIso8601String(),
    };
    try {
      await dbRef.child(id).set(data);
      print("berhasil");
      return const Result.success(true);
    } catch (e) {
      return Result.failed("Gagal menyimpan data: $e");
    }
  }

  @override
  Future<Result<bool>> updateLocation({
    required String id,
    required LatLng location,
    required String updateTime,
  }) async {
    try {
      Map<String, dynamic> data = {
        "location": {
          "latitude": location.latitude,
          "longitude": location.longitude,
        },
        "updateTime": updateTime,
      };
      await dbRef.child(id).update(data);
      return const Result.success(true);
    } catch (e) {
      return Result.failed("Gagal menyimpan data: $e");
    }
  }

  @override
  Future<Result<List<TrackingData>>> getAllTracking() async {
    var result = await dbRef.get();
    if (result.children.isNotEmpty) {
      return Result.success(
        result.children
            .map((e) => TrackingData(
                location: LocationTracking(
                  latitude: double.parse(e.child("latitude").value.toString()),
                  longitude:
                      double.parse(e.child("longitude").value.toString()),
                ),
                // LatLng(double.parse(e.child("address").toString()),
                // double.parse(e.child("address").toString())),
                address: e.child("address").toString(),
                destination: LocationTracking(
                  latitude: double.parse(e.child("latitude").value.toString()),
                  longitude:
                      double.parse(e.child("longitude").value.toString()),
                ),
                updateTime: e.child("updateTime").toString(),
                timestamp: e.child("timestamp").toString()))
            .toList(),
      );
    } else {
      return const Result.failed("failed get data");
    }
  }
}
