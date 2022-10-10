import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:marina_mobility/data/models/requests/login_request.dart';
import 'package:marina_mobility/domain/use_cases/login_usecase.dart';

class LoginViewModel extends GetxController with BaseLoginViewModel{
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);


  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  void login() async{
    (await _loginUseCase.execute(LoginRequest(username: usernameController.text, password: passwordController.text)))
        .fold((failure) {

    }, (userObj){

    });
  }
}

abstract class BaseLoginViewModel{
  void login();
}