import 'dart:convert';

import 'package:marina_mobility/core/constants.dart';
import 'package:marina_mobility/core/network/api_constants.dart';
import 'package:marina_mobility/core/error/exceptions.dart';
import 'package:marina_mobility/data/models/responses/failure.dart';
import 'package:marina_mobility/data/models/responses/login_response.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDataSource{

  Future<LoginResponse> login(String username, password);

}

class RemoteDataSource implements BaseRemoteDataSource{

  @override
  Future<LoginResponse> login(String username, password) async{
    var url = Uri.parse(ApiConstants.login);
    final response = await http.post(url, body: {ApiParameters.username: username, ApiParameters.password: password});
    if(response.statusCode == StatusCodes.success){
      return LoginResponse.fromJson(jsonDecode(response.body));
    }else{
      throw ApiException(failure: Failure.fromJson(jsonDecode(response.body)));
    }
  }

}