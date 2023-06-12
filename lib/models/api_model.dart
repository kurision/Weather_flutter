import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class Weather {
  late String userlocation;
  late String iconUrl;
  late double temperature;
  late String description;
  late int humidity;
  late int visibility;
  late double windSpeed;

  Weather(
      {required this.description,
      required this.iconUrl,
      required this.temperature,
      required this.userlocation,
      required this.humidity,
      required this.visibility,
      required this.windSpeed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final iconCode = weather['icon'];
    final iconUrl = 'https://openweathermap.org/img/w/$iconCode.png';
    final temperature = main['temp'].toDouble();
    final description = weather['description'];
    final humidity = main['humidity'];
    final windSpeed = json['wind']['speed'];
    final userlocation = json['name'];
    final visibility = json['visibility'];
    return Weather(
        userlocation: userlocation,
        iconUrl: iconUrl,
        temperature: temperature,
        description: description,
        humidity: humidity,
        visibility: visibility,
        windSpeed: windSpeed);
  }

  static Future<Weather> getweather(
      String apiKey, LocationData location) async {
    // print(apiKey);
    // print(location);
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      log(response.body);
      return Weather.fromJson(json);
    } else {
      log(response.body);
      throw Exception('Failed To retrieve the weather information');
    }
  }
}
