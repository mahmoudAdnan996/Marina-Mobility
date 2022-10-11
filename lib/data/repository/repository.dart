import 'package:dartz/dartz.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/base_api_client_service.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/exceptions.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/network_info.dart';
import 'package:marina_mobility/data/models/responses/user.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';

import '../data_source/remote_data_source/api_endpoints.dart';
import '../models/requests/login_request.dart';
import '../models/responses/failure.dart';

class Repository extends BaseRepository{
  final BaseApiClientService _baseApiClientService;
  final NetworkInfo _networkInfo;

  Repository(this._baseApiClientService, this._networkInfo);

  @override
  Future<Either<Failure, User>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try {
        final result = await _baseApiClientService.postRequest(EndPoints.login, loginRequest);
        return Right(result);
      }on AppException catch(error){
        return Left(Failure(statusCode: 500, statusMessage: error.toString(), success: false));
      }
    }else{
      return Left(Failure(statusCode: 502, statusMessage: "No internet connection", success: false));
    }
  }

}