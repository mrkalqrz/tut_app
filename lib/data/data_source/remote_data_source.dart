import 'package:flutter_application_sample/data/network/app_api.dart';
import 'package:flutter_application_sample/data/request/request.dart';
import 'package:flutter_application_sample/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
      loginRequest.imei,
      loginRequest.password,
    );
  }
}
