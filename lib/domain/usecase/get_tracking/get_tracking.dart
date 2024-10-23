import 'package:app_tracking/data/repository/realtime_database.dart';
import 'package:app_tracking/domain/model/result.dart';
import 'package:app_tracking/domain/model/tracking_data.dart';
import 'package:app_tracking/domain/usecase/usecase.dart';

class GetTracking implements UseCase<Result<List<TrackingData>>, void> {
  final RealtimeDatabase realtimeDatabase;

  GetTracking({required this.realtimeDatabase});
  @override
  Future<Result<List<TrackingData>>> call(void params) async {
    var result = await realtimeDatabase.getAllTracking();
    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
