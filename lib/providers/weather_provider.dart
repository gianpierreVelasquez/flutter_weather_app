import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String _error = '';

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get error => _error;

  final WeatherService _weatherService = WeatherService();

  // Method to fetch weather data and update state
  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final weatherData = await _weatherService.fetchWeather(city);
      _weather = weatherData;
    } catch (e) {
      _error = 'Failed to load weather data. Please try again later.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
