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
      print(result.children.length);
      return Result.success(
        result.children.map((e) {
          // Pastikan data yang diambil dari child tidak null, tambahkan pengecekan
          var latitude = e.child("latitude").value?.toString() ?? "0.0";
          var longitude = e.child("longitude").value?.toString() ?? "0.0";
          var address =
              e.child("address").value?.toString() ?? "Unknown address";
          var updateTime = e.child("updateTime").value?.toString() ?? "";
          var timestamp = e.child("timestamp").value?.toString() ?? "";

          return TrackingData(
            location: LocationTracking(
              latitude: double.parse(latitude),
              longitude: double.parse(longitude),
            ),
            address: address,
            destination: LocationTracking(
              latitude: double.parse(
                  latitude), // Pastikan ini sesuai dengan data yang benar
              longitude: double.parse(longitude),
            ),
            updateTime: updateTime,
            timestamp: timestamp,
          );
        }).toList(),
      );
    } else {
      return const Result.failed("Failed to get data");
    }
  }
}
