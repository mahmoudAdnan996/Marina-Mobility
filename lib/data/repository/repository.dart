import 'package:dartz/dartz.dart';
import 'package:marina_mobility/core/error/exceptions.dart';
import 'package:marina_mobility/core/network/network_info.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:marina_mobility/domain/entities/user.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';

import '../models/responses/failure.dart';

class Repository extends BaseRepository{
  final BaseRemoteDataSource _baseRemoteDataSource;
  final NetworkInfo _networkInfo;

  Repository(this._baseRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, User>> login(String username, String password) async{
    if(await _networkInfo.isConnected){
      try {
        final result = await _baseRemoteDataSource.login(username, password);
        return Right(result);
      }on ApiException catch(error){
        return Left(error.failure);
      }
    }else{
      return Left(Failure(statusCode: 502, statusMessage: "No internet connection", success: false));
    }
  }

}