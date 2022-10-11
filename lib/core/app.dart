import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:marina_mobility/core/bindings/initial_bindings.dart';
import 'package:marina_mobility/core/extensions.dart';
import 'package:marina_mobility/core/routes/app_pages.dart';
import 'package:marina_mobility/core/routes/app_routes.dart';

class MyApp extends StatefulWidget{

  const MyApp._internal();
  static const MyApp _instance = MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Platform.isAndroid ? getMaterialApp() : getCupertinoApp(),
    );
  }

  GetMaterialApp getMaterialApp(){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.list,
      initialBinding: InitialBindings(),
    );
  }

  GetCupertinoApp getCupertinoApp(){
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.list,
      initialBinding: InitialBindings(),
    );
  }
}