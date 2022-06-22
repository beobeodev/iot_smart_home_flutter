import 'dart:developer';

import 'package:get/get.dart';
import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/core/utils/audio/record_audio.util.dart';
import 'package:iot_smart_home/domain/entities/dht11.entity.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/control_digital_device.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/get_temp_human.usecase.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/predict_by_speech.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';

class HomeController extends GetxController {
  final RootController rootController;
  final ControlDigitalDeviceUseCase controlDigitalDeviceUseCase;
  final PredictBySpeechUseCase predictBySpeechUseCase;
  final GetTempAndHumanUseCase getTempAndHumanUseCase;

  HomeController(
      {required this.rootController,
      required this.controlDigitalDeviceUseCase,
      required this.predictBySpeechUseCase,
      required this.getTempAndHumanUseCase});

  late Rx<RoomEntity> _currentRoom;
  RoomEntity get currentRoom => _currentRoom.value;

  final RxBool _isRecording = false.obs;
  bool get isRecording => _isRecording.value;

  final Rx<DHT11Entity> _currentDTH11 =
      DHT11Entity(humandity: 0, temperature: 0).obs;
  DHT11Entity get currentDHT11 => _currentDTH11.value;

  @override
  void onInit() {
    super.onInit();
    _currentRoom = rootController.currentRaspberry.rooms[0].obs;
  }

  void onChangeDropdownRoom(idSelectedRoom) {
    final RoomEntity selectedRoom = rootController.currentRaspberry.rooms
        .firstWhere((element) => element.id == idSelectedRoom);
    _currentRoom.value = selectedRoom;
  }

  Future<void> changeDigitalDevice(int deviceIndex) async {
    final Map<String, dynamic> passedData = {
      'ip_mac': rootController.currentRaspberry.ipMac,
      'gate': currentRoom.devices[deviceIndex].gate,
      'command': currentRoom.devices[deviceIndex].status ? 0 : 1,
    };

    final RequestState<Map<String, dynamic>> controlState =
        await controlDigitalDeviceUseCase.execute(params: passedData);
    if (controlState is RequestFailed) {
      log(controlState.error.toString());
    } else {
      currentRoom.devices[deviceIndex].status =
          !currentRoom.devices[deviceIndex].status;
    }
  }

  Future<void> onTapButtonRecord() async {
    if (isRecording) {
      final String audioPath = await RecordAudio.stopRecord();
      final String base64Audio = await RecordAudio.getBase64Audio(audioPath);
      final RequestState<Map<String, dynamic>> predictState =
          await predictBySpeechUseCase.execute(params: {
        'fileCode': base64Audio,
      });
    } else {
      await RecordAudio.startRecord();
    }
    _isRecording.value = !_isRecording.value;
  }

  Future<void> getTempAndHuman() async {
    final RequestState<DHT11Entity> dht11State =
        await getTempAndHumanUseCase.execute();
    if (dht11State is RequestSuccess) {
      _currentDTH11.value = dht11State.data!;
      log(dht11State.data.toString());
    }
  }
}
