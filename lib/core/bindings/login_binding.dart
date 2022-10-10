import 'package:get/get.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';
import 'package:marina_mobility/domain/use_cases/login_usecase.dart';
import 'package:marina_mobility/presentation/screens/login/login_vm.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find<BaseRepository>()), tag: (LoginUseCase).toString());
    Get.lazyPut<LoginViewModel>(() => LoginViewModel(Get.find<LoginUseCase>()), tag: (LoginViewModel).toString());
  }

}