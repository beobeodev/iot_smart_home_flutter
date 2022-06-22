class DHT11Entity {
  final int temperature;
  final int humandity;

  DHT11Entity({required this.temperature, required this.humandity});

  @override
  String toString() =>
      'DHT11Entity(temperature: $temperature, humandity: $humandity)';
}
