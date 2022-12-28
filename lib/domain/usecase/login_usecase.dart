import 'package:flutter_application_sample/app/functions.dart';
import 'package:flutter_application_sample/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_sample/data/request/request.dart';
import 'package:flutter_application_sample/domain/model/model.dart';
import 'package:flutter_application_sample/domain/repository/repository.dart';
import 'package:flutter_application_sample/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(
        input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
