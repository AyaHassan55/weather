import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather/models/weather_model.dart';

import '../../pages/search_page.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherInitialState());
   WeatherModel? weatherModel;
 // 3- create function
  getWeather({required String cityName})async{
    try{
      weatherModel=
      await WeatherService(Dio()).getWeather(cityName: cityName);
// send logic to ui
      emit(WeatherLoadedState(weatherModel!));

    }catch(e){
     emit(WeatherFailureState(
       e.toString()
     ));
    }


}

}

