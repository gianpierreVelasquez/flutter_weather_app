import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/weather_card.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City input field
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter city'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Trigger fetch when city name is entered
                String city = _controller.text.trim();
                if (city.isNotEmpty) {
                  context.read<WeatherProvider>().fetchWeather(city);
                }
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (weatherProvider.error.isNotEmpty) {
                  return Center(
                    child: Text(
                      weatherProvider.error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (weatherProvider.weather == null) {
                  return const Center(
                      child: Text('Enter a city to get the weather.'));
                }

                // Weather Data Display
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: const WeatherCard()),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
