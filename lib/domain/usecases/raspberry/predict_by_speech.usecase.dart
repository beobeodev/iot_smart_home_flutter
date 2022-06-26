import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class PredictBySpeechUseCase
    implements UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  final IRaspberryRepository repository;

  PredictBySpeechUseCase({required this.repository});

  @override
  Future<Map<String, dynamic>> execute({
    Map<String, dynamic> params = const {},
  }) async {
    return await repository.predictBySpeech(params);
  }
}
