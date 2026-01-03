import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whats_the_weather/cubit/weather_cubit.dart';
import 'package:whats_the_weather/utiles/permission.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: determinePosition(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snap.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                snap.error.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (snap.hasData) {
          return BlocProvider(
            create: (_) => WeatherCubit()
              ..fetchWeather(snap.data!),
            child: const HomeScreen(),
          );
        }

        return const SizedBox();
      },
    );
  }
}
