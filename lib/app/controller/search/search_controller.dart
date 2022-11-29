import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/app/controller/routs/app_routs.dart';
import 'package:weatherapp_starter_project/app/model/main_model/weather_model.dart';
import 'package:weatherapp_starter_project/app/services/api_service.dart';

class SearchController extends GetxController {
  final dataModel = WeatherModel().obs;
  // function to get user's current location's weather data
  Future<void> getData(String location) async {
    final data = await ApiService.getWeatherDdata(location);
    try {
      if (data.weather != null) {
        dataModel.value = data;
        Get.toNamed(Routes.search);
      } else {
        Get.snackbar(
          'City not found',
          'Please try again with another city name',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(40),
        );
      }
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }
}
