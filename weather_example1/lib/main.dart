import 'package:flutter/material.dart';
// import 'package:weather_example1/models/weather_forecast_daily.dart';
import 'package:weather_example1/screens/location_screens.dart';

// import 'screens/weather_forecast_screens.dart';

void main()=> runApp(MyApp());
 

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: LocationScreen(),
    );
  }
}

