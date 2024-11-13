import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherCard extends StatelessWidget { 
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Card(
      child: Column(
        children: [
          // Display weather icon
          if (weatherProvider.weather!.iconCode.isNotEmpty)
            Image.network(
              'https://openweathermap.org/img/wn/${weatherProvider.weather!.iconCode}.png',
              width: 100,
              height: 100,
            ),
          Text(
            'Temperature: ${weatherProvider.weather!.temperature}°C',
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            'Weather: ${weatherProvider.weather!.description}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
