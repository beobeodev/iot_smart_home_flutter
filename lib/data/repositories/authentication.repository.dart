import 'package:iot_smart_home/core/resouces/request_state.dart';
import 'package:iot_smart_home/core/utils/http/exceptions.dart';
import 'package:iot_smart_home/data/datasources/remote/authentication.datasource.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';
import 'package:iot_smart_home/domain/repositories/iauthentication.repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepository({required this.datasource});

  @override
  Future<RequestState<RaspberryModel>> login(
      Map<String, dynamic> formBody) async {
    try {
      final RaspberryModel raspberryModel = await datasource.login(formBody);
      return RequestSuccess(raspberryModel);
    } on AppException catch (e) {
      return RequestFailed(e);
    } catch (e) {
      return RequestFailed(
          AppException(status: 'Undefined', message: e.toString()));
    }
  }
}
