import 'package:dartz/dartz.dart';
import 'package:marina_mobility/data/models/requests/login_request.dart';
import 'package:marina_mobility/data/models/responses/failure.dart';
import 'package:marina_mobility/domain/entities/user.dart';

abstract class BaseRepository{

  Future<Either<Failure, User>> login(LoginRequest loginRequest);

}