import 'dart:developer';

import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/core/utils/http/exceptions.dart';
import 'package:iot_smart_home/data/datasources/remote/raspberry.datasource.dart';
import 'package:iot_smart_home/data/models/dht11.model.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';
import 'package:iot_smart_home/data/models/room.model.dart';
import 'package:iot_smart_home/domain/repositories/iraspberry.repository.dart';

class RaspberryRepository extends IRaspberryRepository {
  final RaspberryDatasource datasource;

  RaspberryRepository({required this.datasource});

  RaspberryModel? raspberry;

  @override
  Future<RequestState<RaspberryModel>> getRaspberryByIpMac(String ipMac) async {
    try {
      raspberry ??= await datasource.getRaspberryByIpMac(ipMac);

      return RequestSuccess(raspberry!);
    } on AppException catch (e) {
      return RequestFailed(e);
    } catch (e) {
      return RequestFailed(
          AppException(status: 'Undefined', message: e.toString()));
    }
  }

  @override
  Future<RequestState<RoomModel>> addRoomToRasp(
      Map<String, dynamic> formBody) async {
    try {
      final RoomModel room = await datasource.addRoomToRasp(formBody);
      return RequestSuccess(room);
    } on AppException catch (e) {
      return RequestFailed(e);
    } catch (e) {
      return RequestFailed(
          AppException(status: 'Undefined', message: e.toString()));
    }
  }

  @override
  Future<RequestState<Map<String, dynamic>>> controlDigitalDevice(
      Map<String, dynamic> formBody) async {
    try {
      final Map<String, dynamic> controlStatus =
          await datasource.controlDigitalDevice(formBody);
      log(controlStatus.toString());
      return RequestSuccess(controlStatus);
    } on AppException catch (e) {
      return RequestFailed(e);
    } catch (e) {
      return RequestFailed(
          AppException(status: 'Undefined', message: e.toString()));
    }
  }

  @override
  Future<RequestState<Map<String, dynamic>>> predictBySpeech(
      Map<String, dynamic> formBody) async {
    try {
      final Map<String, dynamic> controlStatus =
          await datasource.predictBySpeech(formBody);
      log(controlStatus.toString());
      return RequestSuccess(controlStatus);
    } on AppException catch (e) {
      return RequestFailed(e);
    } catch (e) {
      return RequestFailed(
          AppException(status: 'Undefined', message: e.toString()));
    }
  }

  @override
  Future<RequestState<DHT11Model>> getTempAndHuman() async {
    try {
      final DHT11Model dht11model = await datasource.getTempAndHuman();

      return RequestSuccess(dht11model);
    } on AppException catch (e) {
      return RequestFailed(e);
    } catch (e) {
      return RequestFailed(
          AppException(status: 'Undefined', message: e.toString()));
    }
  }
}
