import 'package:bloc/bloc.dart';
import 'package:know_your_weather/data/repository/weather_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadWeather>((event, emit) async {
      emit(WeatherLoading());
      WeatherModel? data = await getWeather(event.city).first;
      if (data == null) {
        emit(WeatherFailedToLoad());
      } else {
        emit(WeatherLoaded(data));
      }
    });
  }

  Stream<WeatherModel?> getWeather(String city) async* {
    WeatherModel? data = await WeatherRepository.getWeather(city);
    yield data;
  }
}
