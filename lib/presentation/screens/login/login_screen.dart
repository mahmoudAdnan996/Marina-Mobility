import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marina_mobility/presentation/resources/app_values.dart';
import 'package:marina_mobility/presentation/screens/login/login_vm.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _loginViewModel = Get.find<LoginViewModel>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _loginViewModel.usernameController,
          ),
          AppSize.s10.verticalSpace,
          TextField(
            controller: _loginViewModel.passwordController,

          ),
          AppSize.s14.verticalSpace,
          ElevatedButton(onPressed: () => _loginViewModel.login(), child: const Text("Login"))
        ],
      ),
    );
  }
}
