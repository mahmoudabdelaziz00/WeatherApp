
import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b616d44927a940ea9e363352252002';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response =
    await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel ;
    }
  }
