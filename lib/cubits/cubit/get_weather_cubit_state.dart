import 'package:weather_app/models/weather_model.dart';

class GetWeatherCubitState {}

class GetWeatherCubitInitial extends GetWeatherCubitState {}

class GetWeatherCubitLoaded extends GetWeatherCubitState {
  final WeatherModel weatherModel;

  GetWeatherCubitLoaded(this.weatherModel);
}

class GetWeatherCubitFailure extends GetWeatherCubitState {
  final String error;

  GetWeatherCubitFailure(this.error);
}
