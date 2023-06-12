import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:weather_task/screens/forecast.dart';
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

Future<Weather> weatherInfo() async {
  LocationData location = await getlocation();
  Future<Weather>? weather = Weather.getweather(apikey, location);
  return weather;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Weather> weatherinfo = weatherInfo();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatedDate = DateFormat('EEEE, d MMMM').format(now);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          formatedDate,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ForeCast(
                        weather: weatherinfo,
                      )),
            );
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: FutureBuilder<Weather>(
              future: weatherinfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final weather = snapshot.data!;
                  return Stack(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 216, 195, 8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.all(6.5),
                                child: Text(
                                  weather.userlocation,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.yellow),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${weather.temperature.toInt()}\u00B0',
                            style: const TextStyle(
                                fontSize: 150, fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: Container(
                              height: 150,
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Column(children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.air,
                                                size: 50,
                                                color: Color.fromARGB(
                                                    255, 216, 195, 8),
                                              ),
                                              Text(
                                                "${weather.windSpeed.toStringAsFixed(0)}km/s",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 216, 195, 8)),
                                              ),
                                              const Text(
                                                "Wind",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 216, 195, 8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.water_drop_rounded,
                                                size: 50,
                                                color: Color.fromARGB(
                                                    255, 216, 195, 8),
                                              ),
                                              Text(
                                                "${weather.humidity.toString()}%",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 216, 195, 8)),
                                              ),
                                              const Text(
                                                "Humidity",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 216, 195, 8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.remove_red_eye_rounded,
                                                size: 50,
                                                color: Color.fromARGB(
                                                    255, 216, 195, 8),
                                              ),
                                              Text(
                                                weather.visibility.toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 216, 195, 8)),
                                              ),
                                              const Text(
                                                "Visibility",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 216, 195, 8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          )
                        ],
                      ),
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
