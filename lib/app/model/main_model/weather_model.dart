import 'package:weatherapp_starter_project/app/model/sub_models/clouds.dart';
import 'package:weatherapp_starter_project/app/model/sub_models/sys_model.dart';
import 'package:weatherapp_starter_project/app/model/sub_models/temp_model.dart';
import 'package:weatherapp_starter_project/app/model/sub_models/weather_elements.dart';
import 'package:weatherapp_starter_project/app/model/sub_models/wind_model.dart';

class WeatherModel {
  WeatherModel({
    this.weather,
    this.main,
    this.wind,
    this.sys,
    this.name,
    this.clouds,
    this.message,
  });

  List<WeatherElement>? weather;
  Main? main;
  Wind? wind;
  Sys? sys;
  String? name;
  Clouds? clouds;
  String? message;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromJson(x))),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        sys: Sys.fromJson(json["sys"]),
        name: json["name"],
        clouds: Clouds.fromJson(json["clouds"]),
        message: json["message"],
      );
}
