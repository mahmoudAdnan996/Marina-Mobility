import 'dart:convert';

import 'package:marina_mobility/core/constants.dart';
import 'package:marina_mobility/data/network/api_constants.dart';
import 'package:marina_mobility/data/network/base_api_client_service.dart';
import 'package:marina_mobility/data/network/exceptions.dart';
import 'package:marina_mobility/data/models/requests/login_request.dart';
import 'package:marina_mobility/data/models/responses/failure.dart';
import 'package:marina_mobility/data/models/responses/login_response.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDataSource{

  Future<LoginResponse> login(LoginRequest loginRequest);

}

class RemoteDataSource implements BaseRemoteDataSource{
  final BaseApiClientService _baseApiClientService;

  RemoteDataSource(this._baseApiClientService);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async{
    try{
      final response = await _baseApiClientService.postRequest(EndPoints.login, jsonEncode(loginRequest));
      return LoginResponse.fromJson(jsonDecode(response.body));
    }on AppException {
      rethrow;
    }
  }

}