import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';
import 'package:iot_smart_home/domain/entities/room.entity.dart';
import 'package:iot_smart_home/domain/usecases/raspberry/add_room_to_rasp.usecase.dart';
import 'package:iot_smart_home/modules/root/controllers/root.controller.dart';
import 'package:iot_smart_home/widgets/popup_update_device.widget.dart';

class CreateRoomController extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  // Usecase
  final AddRoomToRaspUseCase addRoomToRaspUseCase;

  // other controllers
  final RootController rootController;

  CreateRoomController({
    required this.addRoomToRaspUseCase,
    required this.rootController,
  });

  // RxList<DeviceEntity> devices = <DeviceEntity>[].obs;
  final Rx<RoomEntity> _currentRoom = RoomEntity(name: '', devices: []).obs;
  RoomEntity get currentRoom => _currentRoom.value;

  Future<void> onTapButtonAddDevice() async {
    Get.dialog(
      PopupUpdateDevice(
        addDeviceToList: addDeviceToList,
      ),
    );
  }

  void addDeviceToList(DeviceEntity device) {
    final int indexDevice = _currentRoom.value.devices
        .indexWhere((element) => element.gate == device.gate);
    if (indexDevice == -1) {
      _currentRoom.value.devices.add(device);
    } else {
      _currentRoom.value.devices[indexDevice] = device;
    }
  }

  Future<void> addRoom() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }

    final Map<String, dynamic> roomData = {
      'rasId': rootController.currentRaspberry.id,
      'room': currentRoom.toJson(),
    };

    try {
      final RoomEntity newRoom =
          await addRoomToRaspUseCase.execute(params: roomData);

      rootController.addRoomToRasp(newRoom);

      Get.back();
    } catch (e) {
      log('Error in addRoom() from CreateRoomController: $e');
    }
  }
}
