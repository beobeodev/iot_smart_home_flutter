import 'package:iot_smart_home/data/datasources/local/hive_local.datasource.dart';
import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';

class HiveLocalRepository implements IHiveLocalRepository {
  final HiveLocalDatatasource datatasource;

  HiveLocalRepository({required this.datatasource});

  @override
  Future<void> setLoggedIn(bool value) async {
    await datatasource.setLoggedIn(value);
  }

  @override
  Future<bool?> checkNewUser() async {
    return await datatasource.checkLoggedIn();
  }

  @override
  Future<String?> getIpMac() async {
    return await datatasource.getIpMac();
  }

  @override
  Future<void> saveIpMac(String ipMac) async {
    await datatasource.saveIpMac(ipMac);
  }
}
