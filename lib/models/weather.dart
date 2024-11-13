class Weather {
  final String city;
  final double temperature;
  final String description;
  final String iconCode;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  // Factory method to create a Weather object from JSON
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}
