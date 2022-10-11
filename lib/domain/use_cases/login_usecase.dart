import 'package:dartz/dartz.dart';
import 'package:marina_mobility/data/models/requests/login_request.dart';
import 'package:marina_mobility/data/models/responses/failure.dart';
import 'package:marina_mobility/data/models/responses/user.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';
import 'package:marina_mobility/domain/use_cases/base_usecase.dart';

class LoginUseCase extends BaseUseCase<LoginRequest, User>{
  final BaseRepository _baseRepository;

  LoginUseCase(this._baseRepository);

  @override
  Future<Either<Failure, User>> execute(LoginRequest input) async{
    return _baseRepository.login(input);
  }

}
