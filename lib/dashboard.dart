import 'package:flutter/material.dart';
// import 'homepages.dart';
// import 'calculatorpage.dart';
// import 'temperaturecomverterPage.dart';
// import 'currencyconverterpage.dart';
// import 'settingspage.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Melsha's Flowers"),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Container(
        color: Colors.pinkAccent[50],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildDashboardButton(context, "Katalog", '/home'),
              _buildDashboardButton(context, "Kalkulator Harga Bunga", '/calculator'),
              _buildDashboardButton(context, "Konversi Suhu", '/temperature'),
              _buildDashboardButton(context, "Konversi Mata Uang", '/currency'),
              _buildDashboardButton(context, "Kontak", '/settings'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, String label, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}