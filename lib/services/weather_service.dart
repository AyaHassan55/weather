import 'dart:developer';

// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';
class WeatherService{
  // http://api.weatherapi.com/v1/forecast.json?key=0fa64d09516f4fc7827195711232609&q=cairo&days=1
  final Dio dio;
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='0fa64d09516f4fc7827195711232609';
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName})async{
    try{
      Response response= await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weather = WeatherModel.fromJson(response.data);
      return weather;
    }on DioException catch(e){
      final String errorMessage=e.response?.data['error']['message']??'oops , try later';
      throw Exception(errorMessage);
    }catch(e){
      log(e.toString());
      throw Exception('ybaaay  , try later');
    }

  }
}
