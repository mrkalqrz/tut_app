import 'package:dartz/dartz.dart';
import 'package:flutter_application_sample/data/network/failure.dart';
import 'package:flutter_application_sample/data/request/request.dart';
import 'package:flutter_application_sample/data/responses/responses.dart';
import 'package:flutter_application_sample/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
