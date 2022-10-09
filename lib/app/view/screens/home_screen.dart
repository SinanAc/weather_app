import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/app/controller/home/home_controller.dart';
import 'package:weatherapp_starter_project/app/view/utils/box_deco.dart';
import 'package:weatherapp_starter_project/app/view/widgets/category_card.dart';
import 'package:weatherapp_starter_project/app/view/widgets/search_field.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final control = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDeco.containerBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Obx(
              () {
                final data = control.dataModel.value;
                if (data.weather == null) {
                  return const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                }
                final String temperature =
                    ((data.main?.temp)! * 10.0).toString();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.place_rounded,
                                color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              control.userLocation.value,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            control.isLoading.value
                                ? const SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator())
                                : IconButton(
                                    onPressed: () {
                                      controller.getUserLocation();
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                      size: 30,
                                    ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset('assets/weather/home.png'),
                      const SizedBox(height: 10),
                      Text(
                        '${temperature.substring(0, 2)}.${temperature.substring(3, 4)}°',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${data.weather?.first.description}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      SearchField(
                          searchController: controller.searchController),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: LimitedBox(
                          maxHeight: 220,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategoryCard(
                                  img: 'assets/icons/clouds.png',
                                  title: 'Clouds',
                                  data: data.clouds?.all ?? '0'),
                              const SizedBox(width: 10),
                              CategoryCard(
                                  img: 'assets/icons/humidity.png',
                                  title: 'Humidity',
                                  data: data.main?.humidity.toString() ?? '0'),
                              const SizedBox(width: 10),
                              CategoryCard(
                                  img: 'assets/icons/windspeed.png',
                                  title: 'Wind',
                                  data: data.wind?.speed.toString() ?? '0'),
                              const SizedBox(width: 10),
                              CategoryCard(
                                  img: 'assets/icons/sea_level.png',
                                  title: 'Sea level',
                                  data: data.main?.seaLevel ?? '0'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
