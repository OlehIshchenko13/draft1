import 'dart:convert';
import 'dart:developer';
import 'package:weather_example1/utilities/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_example1/models/weather_forecast_daily.dart';
import 'package:weather_example1/utilities/constants.dart';


class WeatherApi {

  Future<WeatherForecast> fetchWeatherForecast({String? city, bool? isCity}) async {

    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parameters;

    if(isCity == true) {
      var params = {
        'appid':Constants.WEATHER_APP_ID,
        'units':'metric',
        'q':city
      };
      parameters = params;
    } else {
      var params = {
        'appid':Constants.WEATHER_APP_ID,
        'units':'metric',
        'lat': location.latitude.toString(),
        'lon': location.longtitude.toString(),
      };
      parameters = params;
    }


    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}