import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubitCubit , GetWeatherCubitState>(
        builder: (context, state) {
        if (state is GetWeatherCubitInitial) {
          return const NoWeatherBody();
        } else if (state is GetWeatherCubitLoaded) {
          return WeatherInfoBdy(weatherModel: state.weatherModel);
        } else {
          return const Center(
            child: Text(
              'Opps, there is an error',
            ),
          );
        }
      }),
    );
  }
}
