class WeatherModel{
   final String cityName;
   final DateTime date;
   final double temp;
   final String image;
   final double minTemp;
   final double maxTemp;
   final String weatherCondition;
  WeatherModel(

      {required this.cityName,
        required this.date,
        required this.temp,
        required this.image,
        required this.minTemp,
        required this.maxTemp,
        required this.weatherCondition});

 factory WeatherModel.fromJson(dynamic data){

   var jsonData=data["forecast"]["forecastday"][0]['day'];
   return WeatherModel(
     cityName: data['location']['name'],
       date: DateTime.parse(data["current"]["last_updated"],),
       temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        image: jsonData['condition']['icon'],
       minTemp: jsonData['mintemp_c'],
       maxTemp: jsonData['maxtemp_c'],
       weatherCondition: jsonData['condition']['text']);
 }
 

}
