
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b616d44927a940ea9e363352252002';
  final String name = '' ;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {

    try{
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel ;
      
    }on DioException catch (e){
      final String errorMsg = e.response?.data['error']['message'] ?? 'OOPS there was an error ,try later';
      throw Exception(errorMsg);
    }catch (e){
      // log(e.toString());
      throw Exception('OOPS there was an error ,try later');
    }

 // if use http request this code to check error Not using dio
      // if(response.statusCode == 200 ){
      //   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      // }else{
      //   final String errorMessage = response.data['error']['message'];
      //   throw Exception(errorMessage);
      // }
  }
}


