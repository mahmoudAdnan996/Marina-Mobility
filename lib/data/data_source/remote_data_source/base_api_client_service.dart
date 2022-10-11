abstract class BaseApiClientService{
  final String baseURL = 'https://madnan95.mocklab.io';

  Future<dynamic> getRequest(String apiEndPoint);

  Future<dynamic> postRequest(String apiEndPoint, dynamic body);
}