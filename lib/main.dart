// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:whats_the_weather/bloc/weather_bloc_bloc.dart';
// import 'package:whats_the_weather/screens/home_screen.dart';
// import 'package:whats_the_weather/utiles/permission.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env");
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       home: FutureBuilder(
//         future: determinePosition(),
//         builder: (context, snap) {
//           if (snap.hasData) {
//             return BlocProvider<WeatherBlocBloc>(
//               create: (context) => WeatherBlocBloc()..add(
//                 FetchWeather(snap.data as Position)
//                 ),
//               child: const HomeScreen(),
//             );
//           } else {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             ); 
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whats_the_weather/screens/splash_screen.dart';
import 'package:whats_the_weather/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
 