import 'package:flutter_application_sample/data/data_source/remote_data_source.dart';
import 'package:flutter_application_sample/data/mapper/mapper.dart';
import 'package:flutter_application_sample/data/network/error_handler.dart';
import 'package:flutter_application_sample/data/network/network_info.dart';
import 'package:flutter_application_sample/domain/model/model.dart';
import 'package:flutter_application_sample/data/request/request.dart';
import 'package:flutter_application_sample/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_sample/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        //its safe to call the api
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          //success return data
          // return right
          return Right(response.toDomain());
        } else {
          //return biz logic error
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      //return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
