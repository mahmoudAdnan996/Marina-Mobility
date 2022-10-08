import 'package:marina_mobility/data/models/responses/failure.dart';

class ApiException implements Exception{
  final Failure failure;

  const ApiException({required this.failure});

}