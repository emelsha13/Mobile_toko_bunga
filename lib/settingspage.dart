import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kontak")),
      backgroundColor: Colors.pinkAccent, // Set the background color to pink
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Melsha's flowers",
              style: TextStyle(
                fontSize: 32, // Increase font size
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change text color to white
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Email: contact@tokobunga.com",
              style: TextStyle(
                fontSize: 20, // Increase font size
                color: Colors.white, // Change text color to white
              ),
            ),
            Text(
              "Telepon: +62 123 4567 890",
              style: TextStyle(
                fontSize: 20, // Increase font size
                color: Colors.white, // Change text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
