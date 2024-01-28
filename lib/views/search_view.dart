// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search The City',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var getWeatherCubit =
                  BlocProvider.of<GetWeatherCubitCubit>(context);
              getWeatherCubit.getWeather(cityName: value);

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                'search',
              ),
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: 'search a city',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
