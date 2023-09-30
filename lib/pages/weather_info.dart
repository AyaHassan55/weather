import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return  Container(
       decoration:BoxDecoration(
         gradient: LinearGradient(
           colors:[
             getThemeColor(weatherModel.weatherCondition),
             getThemeColor(weatherModel.weatherCondition)[300]!,
             getThemeColor(weatherModel.weatherCondition)[50]!,



           ],
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
         ),
       ) ,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherModel.cityName,
                  style:const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                ),
                ),
                Text('updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style:const TextStyle(
                  fontSize: 24,
                ),),
                const SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https:${weatherModel.image}"),
                    Text(
                      weatherModel.temp.toString(),
                      style:const TextStyle(
                      fontSize: 32,
                        fontWeight: FontWeight.bold,
                    ),),
                    Column(children: [
                      Text('maxTemp : ${weatherModel.maxTemp.round()}',
                        style:const TextStyle(
                          fontSize: 19
                      ),),
                      Text('minTemp :${weatherModel.minTemp.round()}',
                        style:const TextStyle(
                          fontSize: 19
                      ),),
                    ],),

                  ],
                ),

                Text(weatherModel.weatherCondition,style:const TextStyle(
                  fontSize: 32,fontWeight: FontWeight.bold,
                ),),
              ],



      ),
          ),
        ),
    );
  }
}
