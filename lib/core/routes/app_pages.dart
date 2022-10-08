import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marina_mobility/core/bindings/initial_bindings.dart';
import 'package:marina_mobility/core/bindings/login_binding.dart';
import 'package:marina_mobility/core/routes/app_routes.dart';
import 'package:marina_mobility/view/screens/login_screen/view/login_screen.dart';
import 'package:marina_mobility/view/screens/splash_screen/view/splash_screen.dart';

class AppPages{
  static var list = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen(), binding: InitialBindings()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen(), binding: LoginBinding()),
  ];
}