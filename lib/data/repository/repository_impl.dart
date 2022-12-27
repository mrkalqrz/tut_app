import 'package:flutter_application_sample/data/data_source/remote_data_source.dart';
import 'package:flutter_application_sample/data/mapper/mapper.dart';
import 'package:flutter_application_sample/data/network/network_info.dart';
import 'package:flutter_application_sample/domain/model.dart';
import 'package:flutter_application_sample/data/request/request.dart';
import 'package:flutter_application_sample/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_sample/domain/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its safe to call the api
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        //success return data
        // return right
        return Right(response.toDomain());
      } else {
        //return biz logic error
        return Left(Failure(
            409, response.message ?? "we have biz error logic from API side"));
      }
    } else {
      //return connection error
      return Left(Failure(501, "please check your network connection"));
    }
  }
}
