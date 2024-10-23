import 'package:app_tracking/data/firebase/firebase_realtime_database.dart';
import 'package:app_tracking/data/repository/realtime_database.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/create_tracking/create_tracking_params.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

class CreateTracking implements UseCase<Result<bool>, CreateTrackingParams> {
  final RealtimeDatabase realtimeDatabase;

  CreateTracking({required this.realtimeDatabase});

  @override
  Future<Result<bool>> call(CreateTrackingParams params) async {
    var result = await realtimeDatabase.createTracking(
        location: params.location,
        address: params.address,
        destination: params.destination,
        id: params.id);
    if (result.isSuccess) {
      print("object use case");

      return const Result.success(true);
    } else {
      return const Result.failed("Error create data");
    }
  }
}
