import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/weather_model.dart';
import '../bloc/weather_bloc.dart';

class SecondPage extends StatelessWidget {
  final Size size;
  final TextEditingController _searchFieldController = TextEditingController();

  final WeatherModel data;
  SecondPage(this.data, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc bloc = BlocProvider.of<WeatherBloc>(context);
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: size.height * .4,
                  width: size.width * .4,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          data.getWeatherIcon,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                data.getCityName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                data.getCountry,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                '${data.getTemperature} C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                data.getWeatherDescription,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * .1,
                  top: size.height * .05,
                ),
                child: TextField(
                  controller: _searchFieldController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        bloc.add(
                          LoadWeather(_searchFieldController.text),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                    hintText: 'Enter city',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
