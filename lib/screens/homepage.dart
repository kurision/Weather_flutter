import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../key.dart';
import '../models/api_model.dart';

Future<LocationData> getlocation() async {
  Location location = Location();

  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
  }
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
  }
  LocationData locationData = await location.getLocation();

  return locationData;
}

Future<Weather> weatherInfo()async{
  LocationData location= await getlocation();
  Future<Weather>? weather = Weather.getweather(apikey, location);
  return weather;
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Weather> weatherinfo= weatherInfo();



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Center(
          child: FutureBuilder<Weather>(
              future: weatherinfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final weather = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather.temperature}C',
                        style: const TextStyle(fontSize: 48),
                      ),
                      Image.network(weather.iconUrl),
                      Text(
                        weather.description,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        weather.userlocation,
                        style: const TextStyle(fontSize: 24),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}
