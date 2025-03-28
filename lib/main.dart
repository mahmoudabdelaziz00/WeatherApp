import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                      BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition,
                    ),
                  ),
                  home: HomeView(),
                );
              },
            ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? conditionWeather) {
  if (conditionWeather == null) {
    return Colors.blue;
  }

  if (["Sunny"].contains(conditionWeather)) {
    return Colors.orange;
  } else if (["Clear", "Overcast", "Fog", "Freezing fog"]
      .contains(conditionWeather)) {
    return Colors.blueGrey;
  } else if (["Partly cloudy", "Patchy rain possible", "Light rain"]
      .contains(conditionWeather)) {
    return Colors.lightBlue;
  } else if (["Cloudy"].contains(conditionWeather)) {
    return Colors.grey;
  } else if (["Moderate rain", "Heavy rain", "Torrential rain shower"]
      .contains(conditionWeather)) {
    return Colors.blue;
  } else if (["Patchy snow possible", "Light snow"]
      .contains(conditionWeather)) {
    return Colors.lightBlue;
  } else if (["Moderate snow", "Heavy snow", "Blizzard"]
      .contains(conditionWeather)) {
    return Colors.indigo;
  } else if ([
    "Thundery outbreaks possible",
    "Moderate or heavy rain with thunder",
    "Patchy light rain with thunder"
  ].contains(conditionWeather)) {
    return Colors.deepPurple;
  } else if (["Ice pellets"].contains(conditionWeather)) {
    return Colors.cyan;
  } else {
    return Colors.blueGrey; // Default color for unknown conditions
  }
}
