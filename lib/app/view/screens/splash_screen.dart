import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weatherapp_starter_project/app/controller/splash/splash_controller.dart';
import 'package:weatherapp_starter_project/app/view/utils/box_deco.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Container(
        decoration: BoxDeco.containerBoxDecoration(),
        child: Center(
            child: Image.asset(
          'assets/weather/splash.png',
          height: 150,
        )));
  }

}