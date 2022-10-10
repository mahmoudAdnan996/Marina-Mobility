import 'dart:convert';
import 'dart:io';

import 'package:marina_mobility/data/network/base_api_client_service.dart';
import 'package:http/http.dart' as http;
import 'package:marina_mobility/data/network/exceptions.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class ApiClientService extends BaseApiClientService{

  Map<String, String> headers = {
    contentType: applicationJson,
    accept: applicationJson,
  };

  @override
  Future getRequest(String apiEndPoint) async{
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseURL + apiEndPoint), headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future postRequest(String apiEndPoint, body) async{
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseURL + apiEndPoint), headers: headers, body: body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

}