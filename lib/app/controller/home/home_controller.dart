import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/app/model/main_model/weather_model.dart';
import 'package:weatherapp_starter_project/app/services/api_service.dart';

class HomeController extends GetxController {
  // variables
  final searchController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString userLocation = 'Location'.obs;
  RxString location = ''.obs;
  final dataModel = WeatherModel().obs;       

  //fuction to get user's current location
  Future<void> getUserLocation() async {
    isLoading(true);
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Get.snackbar('Permission',
          'Location permission denied, please click the refresh button to request again');
      isLoading(false);
      return;
    } else if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Permission',
          'Location permission denied, please enable from settings');
      isLoading(false);
      return;
    } else {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await placemarkFromCoordinates(position.latitude, position.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        userLocation.value = '${place.locality}, ${place.administrativeArea}';
        location.value = '${place.administrativeArea}';
      });
    }
    isLoading(false);
  }

  // function to get user's current location's weather data
  Future<void> getData() async {
    final data = await ApiService.getWeatherDdata(location.value);
    try {
      if (data.weather != null) {
        dataModel.value = data;
      }
    } catch (e) {
      Get.snackbar('Something went wrong', 'Please try again later');
    }
  }

  @override
  void onInit() {
    getUserLocation().then((_) {
      getData();
    });
    super.onInit();
  }
}
