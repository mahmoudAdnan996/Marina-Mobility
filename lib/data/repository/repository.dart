import 'package:dartz/dartz.dart';
import 'package:marina_mobility/data/network/exceptions.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:marina_mobility/data/network/network_info.dart';
import 'package:marina_mobility/domain/entities/user.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';

import '../models/requests/login_request.dart';
import '../models/responses/failure.dart';

class Repository extends BaseRepository{
  final BaseRemoteDataSource _baseRemoteDataSource;
  final NetworkInfo _networkInfo;

  Repository(this._baseRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, User>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try {
        final result = await _baseRemoteDataSource.login(loginRequest);
        return Right(result);
      }on AppException catch(error){
        return Left(Failure(statusCode: 500, statusMessage: error.toString(), success: false));
      }
    }else{
      return Left(Failure(statusCode: 502, statusMessage: "No internet connection", success: false));
    }
  }

}