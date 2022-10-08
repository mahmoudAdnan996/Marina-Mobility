import 'package:get/get.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';

class LoginViewModel extends GetxController with BaseLoginViewModel{
  final BaseRepository _baseRepository;

  LoginViewModel(this._baseRepository);

  @override
  void login(String username, String password) async{
    (await _baseRepository.login(username, password))
        .fold((failure) {

    }, (userObj){

    });
  }
}

abstract class BaseLoginViewModel{
  void login(String username, String password);
}