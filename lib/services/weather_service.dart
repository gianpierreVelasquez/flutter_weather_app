import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  final String apiKey = '57803217f6546fbeb97507d1c282425b';

  // Method to fetch weather data from OpenWeather API
  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the response is successful, parse the JSON data
      final weatherData = json.decode(response.body);
      return Weather.fromJson(weatherData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
