import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/api_client_service.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/base_api_client_service.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/network_info.dart';
import 'package:marina_mobility/data/repository/repository.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<BaseApiClientService>(ApiClientService(), tag: (BaseApiClientService).toString(), permanent: true);
    Get.put<NetworkInfo>(NetworkInfoImpl(InternetConnectionChecker()), tag: (NetworkInfo).toString(), permanent: true);
    Get.put<BaseRepository>(Repository(Get.find<BaseApiClientService>(), Get.find<NetworkInfo>()), tag: (BaseRepository).toString(), permanent: true);
  }

}