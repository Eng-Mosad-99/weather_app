import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubitCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubitCubit, GetWeatherCubitState>(
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
                theme: ThemeData(
                  primaryColor: getThemeColor(
                    BlocProvider.of<GetWeatherCubitCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ));
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
    case 'Patchy light rain with thunder':
      return Colors.amber;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Mist':
      return Colors.indigo;
    case 'Patchy rain possible':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain with thunder':
      return Colors.green;
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}
