import 'package:hive/hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iot_smart_home/core/constants/key_box_hive.dart';
import 'package:iot_smart_home/core/constants/key_env.dart';

abstract class IHiveLocalDatasource {
  Future<Box> openAuthBox();
  Future<void> setIpMac(String ipMac);
  Future<String?> getIpMac();
  Future<void> deleteIpMac();
}

class HiveLocalDatatasource implements IHiveLocalDatasource {
  @override
  Future<Box> openAuthBox() async {
    return await Hive.openBox(dotenv.env[KeyEnv.authBox]!);
  }

  @override
  Future<void> setIpMac(String ipMac) async {
    final Box authBox = await openAuthBox();
    await authBox.put(KeyBoxHive.ipMac, ipMac);
  }

  @override
  Future<String?> getIpMac() async {
    final Box authBox = await openAuthBox();
    return authBox.get(KeyBoxHive.ipMac);
  }

  @override
  Future<void> deleteIpMac() async {
    final Box authBox = await openAuthBox();
    return await authBox.delete(KeyBoxHive.ipMac);
  }
}
