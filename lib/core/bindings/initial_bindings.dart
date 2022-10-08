import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marina_mobility/core/network/network_info.dart';
import 'package:marina_mobility/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:marina_mobility/data/repository/repository.dart';
import 'package:marina_mobility/domain/repository/base_repository.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<BaseRemoteDataSource>(RemoteDataSource(), tag: (BaseRemoteDataSource).toString(), permanent: true);
    Get.put<NetworkInfo>(NetworkInfoImpl(InternetConnectionChecker()), tag: (NetworkInfo).toString(), permanent: true);
    Get.put<BaseRepository>(Repository(Get.find<BaseRemoteDataSource>(), Get.find<NetworkInfo>()), tag: (BaseRepository).toString(), permanent: true);
  }

}