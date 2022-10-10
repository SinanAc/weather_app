import 'dart:async';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/app/controller/routs/app_routs.dart';

class SplashController extends GetxController{
  @override
  void onInit(){
    super.onInit();
     Timer(
      const Duration(seconds: 2),
      () => Get.offNamed(Routes.home),
    );
  }
}