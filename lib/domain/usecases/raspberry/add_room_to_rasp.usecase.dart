import 'package:iot_smart_home/domain/entities/room.entity.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';
import 'package:iot_smart_home/domain/usecases/use_case.dart';

class AddRoomToRaspUseCase extends UseCase<RoomEntity, Map<String, dynamic>> {
  final IRaspberryRepository repository;

  AddRoomToRaspUseCase({required this.repository});

  @override
  Future<RoomEntity> execute({
    Map<String, dynamic> params = const {},
  }) async {
    return await repository.addRoomToRasp(params);
  }
}
