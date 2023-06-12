import 'package:flutter/material.dart';

import '../models/api_model.dart';
import 'homepage.dart';

class ForeCast extends StatefulWidget {
  final Future<Weather> weather;

  const ForeCast({super.key, required this.weather});

  @override
  State<ForeCast> createState() => _ForeCastState();
}

class _ForeCastState extends State<ForeCast> {
  late Future<Weather> weatherinfo = weatherInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Weather Forecast",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
                      children: [
                        const SizedBox(
                          height: 75,
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunday',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 216, 195, 8),
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${weather.temperature.toStringAsFixed(0)}\u00B0C",
                                              style: const TextStyle(
                                                  fontSize: 50,
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                            const Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                          ],
                                        ),
                                        Column(
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
                                        Column(
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
                                        Column(
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
                                      ],
                                    )
                                  ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunday',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 216, 195, 8),
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${weather.temperature.toStringAsFixed(0)}\u00B0C",
                                              style: const TextStyle(
                                                  fontSize: 50,
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                            const Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                          ],
                                        ),
                                        Column(
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
                                        Column(
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
                                        Column(
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
                                      ],
                                    )
                                  ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunday',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 216, 195, 8),
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${weather.temperature.toStringAsFixed(0)}\u00B0C",
                                              style: const TextStyle(
                                                  fontSize: 50,
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                            const Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                          ],
                                        ),
                                        Column(
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
                                        Column(
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
                                        Column(
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
                                      ],
                                    )
                                  ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunday',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 216, 195, 8),
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${weather.temperature.toStringAsFixed(0)}\u00B0C",
                                              style: const TextStyle(
                                                  fontSize: 50,
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                            const Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                          ],
                                        ),
                                        Column(
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
                                        Column(
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
                                        Column(
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
                                      ],
                                    )
                                  ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunday',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 216, 195, 8),
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${weather.temperature.toStringAsFixed(0)}\u00B0C",
                                              style: const TextStyle(
                                                  fontSize: 50,
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                            const Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 216, 195, 8)),
                                            ),
                                          ],
                                        ),
                                        Column(
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
                                        Column(
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
                                        Column(
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
                                      ],
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
