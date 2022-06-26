import 'package:iot_smart_home/domain/entities/dht11.entity.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class GetTempAndHumanUseCase implements UseCase<DHT11Entity, dynamic> {
  final IRaspberryRepository repository;

  GetTempAndHumanUseCase({required this.repository});

  @override
  Future<DHT11Entity> execute({params}) async {
    return await repository.getTempAndHuman();
  }
}
