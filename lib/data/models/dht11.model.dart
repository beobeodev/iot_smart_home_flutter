import 'package:iot_smart_home/domain/entities/dht11.entity.dart';

class DHT11Model extends DHT11Entity {
  DHT11Model({required int temperature, required int humandity})
      : super(temperature: temperature, humidity: humandity);

  factory DHT11Model.fromJson(Map<String, dynamic> json) {
    return DHT11Model(
      temperature: json['temperature'],
      humandity: json['humidity'],
    );
  }
}
