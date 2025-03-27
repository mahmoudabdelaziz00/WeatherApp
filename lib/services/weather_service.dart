import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b616d44927a940ea9e363352252002';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel ;
    }
  }
