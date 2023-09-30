import 'package:flutter/material.dart';
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Image(image: AssetImage('assets/images/ser.jpeg')),
          Text('There is no weather now ,start search'),
        ],
        ),
    );
  }
}
