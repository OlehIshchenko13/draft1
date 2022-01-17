import 'package:flutter/material.dart';
import 'package:weather_example1/models/weather_forecast_daily.dart';
import 'package:weather_example1/widgets/forecast_card.dart';



class BottomListViev extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  BottomListViev({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140.0,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Colors.black87,
                child: forecastCard(snapshot, index),),
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data!.list!.length,
          ),
        ),
      ],
    );
  }
}
