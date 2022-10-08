import 'package:get/get.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';
import 'package:marina_mobility/view/screens/login_screen/view_model/login_view_model.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel(Get.find<BaseRepository>()), tag: (LoginViewModel).toString());
  }

}