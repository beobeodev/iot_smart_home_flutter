import 'package:iot_smart_home/core/utils/dio/dio_provider.dart';
import 'package:iot_smart_home/data/datasources/remote/authentication.datasource.dart';
import 'package:iot_smart_home/data/models/raspberry.model.dart';
import 'package:iot_smart_home/domain/repositories/iauthentication.repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final AuthenticationRemoteDatasource datasource;

  AuthenticationRepository({required this.datasource});

  @override
  Future<RaspberryModel> login(
    Map<String, dynamic> formBody,
  ) async {
    final HttpRequestResponse loginResponse = await datasource.login(formBody);
    return RaspberryModel.fromJson(loginResponse.data);
  }
}
