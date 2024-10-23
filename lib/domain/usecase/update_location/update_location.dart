import 'package:app_tracking/data/repository/realtime_database.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/usecase/update_location/update_location_params.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

class UpdateLocation implements UseCase<Result<bool>, UpdatdateLocationParams> {
  final RealtimeDatabase realtimeDatabase;

  UpdateLocation({required this.realtimeDatabase});

  @override
  Future<Result<bool>> call(params) async {
    var result = await realtimeDatabase.updateLocation(
      id: params.id,
      location: params.location,
      updateTime: DateTime.now().toIso8601String(),
    );
    if (result.isSuccess) {
      print("Berhasil Update");
      return const Result.success(true);
    } else {
      return const Result.failed("Failed Update Data");
    }
  }
}
