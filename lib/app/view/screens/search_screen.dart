import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/app/controller/search/search_controller.dart';
import 'package:weatherapp_starter_project/app/view/utils/box_deco.dart';
import 'package:weatherapp_starter_project/app/view/utils/sized_boxes.dart';
import 'package:weatherapp_starter_project/app/view/widgets/category_card.dart';
import 'package:weatherapp_starter_project/app/view/widgets/text_widget.dart';

class SearchScreen extends GetView<SearchController> {
  SearchScreen({Key? key}) : super(key: key);
  final control = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDeco.containerBoxDecoration(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Obx(
            () {
              final data = control.dataModel.value;
              if (data.weather == null) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextWidget(
                            text: 'Please wait or try again later',
                            fontSize: 18),
                        KSizedBox.kHeigh_10,
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              }
              final String temperature = ((data.main?.temp)! * 10.0).toString();
              final String minTemp = ((data.main?.tempMin)! * 10.0).toString();
              final String maxTemp = ((data.main?.tempMax)! * 10.0).toString();
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.place_rounded,
                                color: Colors.white),
                            KSizedBox.kWidth_5,
                            TextWidget(
                                text: data.name ?? 'No name provided',
                                fontSize: 18),
                          ],
                        ),
                      ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KSizedBox.kHeigh_30,
                    Image.asset(
                        'assets/weather/${data.weather?.first.icon}.png',),
                    KSizedBox.kHeigh_10,
                    TextWidget(
                        text:
                            '${temperature.substring(0, 2)}.${temperature.substring(3, 4)}°',
                        fontSize: 40),
                    TextWidget(
                        text: '${data.weather?.first.description}',
                        fontSize: 25),
                    KSizedBox.kHeigh_25,
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: LimitedBox(
                        maxHeight: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CategoryCard(
                                img: 'assets/weather/splash.png',
                                title: 'Min temp',
                                data:
                                    '${minTemp.substring(0, 2)}.${minTemp.substring(3, 4)}°'),
                            KSizedBox.kWidth_10,
                            CategoryCard(
                                img: 'assets/icons/humidity.png',
                                title: 'Humidity',
                                data: '${data.main?.humidity ?? '0'}%'),
                            KSizedBox.kWidth_10,
                            CategoryCard(
                                img: 'assets/weather/splash.png',
                                title: 'Max temp',
                                data:
                                    '${maxTemp.substring(0, 2)}.${maxTemp.substring(3, 4)}°'),
                            KSizedBox.kWidth_10,
                            CategoryCard(
                                img: 'assets/icons/windspeed.png',
                                title: 'Wind',
                                data: '${data.wind?.speed ?? '0'}/km'),
                            KSizedBox.kWidth_10,
                            CategoryCard(
                                img: 'assets/icons/clouds.png',
                                title: 'Clouds',
                                data: data.clouds?.all ?? '0'),
                            KSizedBox.kWidth_10,
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
    );
  }
}
