import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder <GetWeatherCubit , WeatherState>(
          builder: (context , state){
            if(state is WeatherInitialState){
              return const NoWeatherBody();
            }else if(state is WeatherLoadedState){
              return WeatherInfoBody(
                weather: state.weatherModel,
              );
            }else{
              return const Text('OOPS , There was an error');
            }
          },
      ),
    );
  }
}

/*
* Steps Of Bloc Pattern :-
* 1. Create State
* 2. Create Cubit
* 3. Create Function
* 4. Provide Cubit
* 5. integrate Cubit
* 6. Trigger Cubit
* */