import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String key = '6ee5905316df4e25b76225757232011';
    String baseUrl = 'http://api.weatherapi.com/v1';

    Uri url = Uri.parse('$baseUrl/forecast.json?key=$key&q=$cityName&days=7');

    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
