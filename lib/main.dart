import 'package:flutter/material.dart';
import 'homepages.dart';
import 'dashboard.dart';
import 'calculatorpage.dart';
import 'temperaturecomverterpage.dart';
import 'currencyconverterpage.dart';
import 'settingspage.dart';
import 'splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Bunga App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/dashboard': (context) => const Dashboard(),
        '/home': (context) => const HomePages(),
        '/calculator': (context) => const CalculatorPage(),
        '/temperature': (context) => const TemperatureConverterPage(),
        '/currency': (context) => const CurrencyConverterPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
