import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/pages/weather_info.dart';

import 'no_weather.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       backgroundColor: Color(0xffFFFFFF),
       appBar: AppBar(
         title: const Text('Weather App'),
         actions: [
           IconButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return SearchPage();

             }));
           },
               icon:const Icon(Icons.search),),
         ],
       ),
      body : BlocBuilder<GetWeatherCubit,WeatherState>(
        builder:(context,state){
         if(state is WeatherInitialState){
           return const NoWeatherBody();
         }else if(state is WeatherLoadedState){
           return WeatherInfoBody(
             weather: state.weatherModel,
           );
         }
         else{
           return const Text('oops there was an error');
         }
        },
      ),

    );
  }
}
