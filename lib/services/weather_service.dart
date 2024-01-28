import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '4e2dd386fc954733af2193306232512';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Opps, there is an dio exception error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(
        'There is an error',
      );
    }
  }
}
