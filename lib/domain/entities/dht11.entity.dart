class DHT11Entity {
  final int temperature;
  final int humidity;

  DHT11Entity({required this.temperature, required this.humidity});

  @override
  String toString() =>
      'DHT11Entity(temperature: $temperature, humandity: $humidity)';
}
