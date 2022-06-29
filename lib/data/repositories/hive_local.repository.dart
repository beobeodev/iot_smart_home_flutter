import 'package:iot_smart_home/data/datasources/local/hive_local.datasource.dart';
import 'package:iot_smart_home/domain/repositories/ihive_local.repository.dart';

class HiveLocalRepository implements IHiveLocalRepository {
  final HiveLocalDatatasource datatasource;

  HiveLocalRepository({required this.datatasource});

  @override
  Future<void> setIpMac(String ipMac) async {
    await datatasource.setIpMac(ipMac);
  }

  @override
  Future<String?> getIpMac() async {
    return await datatasource.getIpMac();
  }

  @override
  Future<void> deleteIpMac() async {
    return await datatasource.deleteIpMac();
  }
}
