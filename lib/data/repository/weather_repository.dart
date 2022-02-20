import 'package:know_your_weather/data/services/weather_service.dart';

import '../models/weather_model.dart';

class WeatherRepository {
  static Future<WeatherModel> getWeather(String query) async {
    var response = await WeatherService.getWeather(query);

    WeatherModel weatherData = WeatherModel.fromJson(response.body.toString());

    return weatherData;
  }
}
