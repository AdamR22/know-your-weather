import 'dart:convert';

class WeatherModel {
  final String _cityName;
  final String _country;
  final String _temperature;
  final String _weatherIcon;
  final String _weatherDescription;

  WeatherModel(
    this._cityName,
    this._country,
    this._temperature,
    this._weatherIcon,
    this._weatherDescription,
  );

  String get getCityName => _cityName;
  String get getCountry => _country;
  String get getTemperature => _temperature;
  String get getWeatherIcon => _weatherIcon;
  String get getWeatherDescription => _weatherDescription;

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      map['location']['name'].toString(),
      map['location']['country'].toString(),
      map['current']['temperature'].toString(),
      map['current']['weather_icons'][0].toString(),
      map['current']['weather_descriptions'][0].toString(),
    );
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));
}
