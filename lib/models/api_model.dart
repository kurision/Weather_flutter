import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class Weather {
  late String userlocation;
  late String iconUrl;
  late double temperature;
  late String description;

  Weather(
      {required this.description,
      required this.iconUrl,
      required this.temperature,
      required this.userlocation});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final iconCode = weather['icon'];
    final iconUrl = 'https://openweathermap.org/img/w/$iconCode.png';
    final temperature = main['temp'].toDouble();
    final description = weather['description'];
    final userlocation = json['name'];
    return Weather(
        userlocation: userlocation,
        iconUrl: iconUrl,
        temperature: temperature,
        description: description);
  }

  static Future<Weather> getweather(
      String apiKey, LocationData location) async {
    print(apiKey);
    print(location);
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

