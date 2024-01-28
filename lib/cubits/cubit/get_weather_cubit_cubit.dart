import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubitCubit extends Cubit<GetWeatherCubitState> {
  GetWeatherCubitCubit() : super(GetWeatherCubitInitial());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(GetWeatherCubitLoaded(weatherModel!));
    } catch (e) {
      emit(GetWeatherCubitFailure(e.toString()));
    }
  }
}

/// create states
/// create cubit
/// create function
/// provide cubit
/// integrate cubit
/// trigger cubit