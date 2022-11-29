import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weatherapp_starter_project/api_key.dart';
import 'package:weatherapp_starter_project/app/model/main_model/weather_model.dart';

class ApiService {
  static Future<WeatherModel> getWeatherDdata(String location) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey';
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        return WeatherModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return WeatherModel(message: 'City not found');
      } else if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        return WeatherModel(message: 'Connection timed out !!');
      } else {
        return WeatherModel(message: e.message);
      }
    } on TimeoutException catch (e) {
      return WeatherModel(message: e.message);
    } on SocketException catch (e) {
      return WeatherModel(message: e.message);
    } catch (e) {
      return WeatherModel(message: 'Something went wrong');
    }
  }
}
