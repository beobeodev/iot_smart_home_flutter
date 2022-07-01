import 'dart:developer';

import 'package:get/get.dart';
import 'package:iot_smart_home/core/utils/audio/record_audio.util.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';
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

  HomeController({
    required this.rootController,
    required this.controlDigitalDeviceUseCase,
    required this.predictBySpeechUseCase,
    required this.getTempAndHumanUseCase,
  });

  final RxInt _currentIndexRoom = 0.obs;
  int get currentIndexRoom => _currentIndexRoom.value;
  // late Rx<RoomEntity> _currentRoom;
  RoomEntity? get currentRoom {
    if (rootController.currentRaspberry.rooms.isNotEmpty) {
      return rootController.currentRaspberry.rooms[currentIndexRoom];
    }
    return null;
  }

  final RxBool _isRecording = false.obs;
  bool get isRecording => _isRecording.value;

  final Rx<DHT11Entity> _currentDTH11 =
      DHT11Entity(humidity: 0, temperature: 0).obs;
  DHT11Entity get currentDHT11 => _currentDTH11.value;

  // @override
  // void onInit() {
  //   super.onInit();

  //   // if (rootController.currentRaspberry.rooms.isNotEmpty) {
  //   //   _currentRoom = rootController.currentRaspberry.rooms[0].obs;
  //   // }
  // }

  void onChangeDropdownRoom(String? idSelectedRoom) {
    final int selectedRoomIndex = rootController.currentRaspberry.rooms
        .indexWhere((element) => element.id == idSelectedRoom);
    // _currentRoom.value = selectedRoom;
    _currentIndexRoom.value = selectedRoomIndex;
  }

  Future<void> controlDigitalDevice(int deviceIndex) async {
    final Map<String, dynamic> passedData = {
      'ip_mac': rootController.currentRaspberry.ipMac,
      'id_ras': rootController.currentRaspberry.id,
      'id_room': currentRoom!.id,
      'id_device': currentRoom!.devices[deviceIndex].id,
      'gate': currentRoom!.devices[deviceIndex].gate,
      'command': currentRoom!.devices[deviceIndex].status ? 0 : 1,
    };

    try {
      final Map<String, dynamic> controlState =
          await controlDigitalDeviceUseCase.execute(params: passedData);

      final List<DeviceEntity> tempDevices = List.from(currentRoom!.devices);
      tempDevices[deviceIndex].status = !tempDevices[deviceIndex].status;

      rootController.updateDevicesInRasp(tempDevices, currentIndexRoom);
      update([currentRoom!.devices[deviceIndex].id]);
    } catch (e) {
      log('Error in controlDigitalDevice() from HomeController: #e');
    }
  }

  Future<void> onTapButtonRecord() async {
    if (isRecording) {
      _isRecording.value = false;

      try {
        final String audioPath = await RecordAudioUtil.stopRecord();
        final String base64Audio =
            await RecordAudioUtil.getBase64Audio(audioPath);

        final Map<String, dynamic> predictResult =
            await predictBySpeechUseCase.execute(
          params: {
            'ipMac': rootController.currentRaspberry.ipMac,
            'fileCode': base64Audio,
          },
        );

        rootController.updateRaspberryAfterPredict(
          roomId: predictResult['roomId'] as String,
          deviceId: predictResult['deviceId'] as String,
          command: predictResult['command'] as int,
        );
        update([
          predictResult['deviceId'] as String,
        ]);

        log(predictResult.toString());
      } catch (e) {
        log('Error in onTapButtonRecord() from HomeController: $e');
      }
    } else {
      _isRecording.value = true;

      await RecordAudioUtil.startRecord();
    }
  }

  Future<void> getTempAndHuman() async {
    try {
      final DHT11Entity dht11State = await getTempAndHumanUseCase.execute();
      _currentDTH11.value = dht11State;
    } catch (e) {
      log('Error in getTempAndHuman() from HomeController: $e');
    }
  }
}
