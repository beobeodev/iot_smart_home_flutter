import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/core/utils/http/exceptions.dart';
import 'package:iot_smart_home/data/datasources/remote/raspberry.datasource.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';
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
}
