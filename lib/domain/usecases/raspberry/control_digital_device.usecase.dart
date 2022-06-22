import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class ControlDigitalDeviceUseCase
    extends UseCase<RequestState<Map<String, dynamic>>, Map<String, dynamic>> {
  final IRaspberryRepository repository;

  ControlDigitalDeviceUseCase({required this.repository});

  @override
  Future<RequestState<Map<String, dynamic>>> execute(
      {Map<String, dynamic> params = const {}}) async {
    return await repository.controlDigitalDevice(params);
  }
}
