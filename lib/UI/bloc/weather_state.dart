part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel data;
  WeatherLoaded(this.data);
}

class WeatherFailedToLoad extends WeatherState {}
