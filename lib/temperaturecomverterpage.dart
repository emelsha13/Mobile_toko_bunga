import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final TextEditingController _tempController = TextEditingController();
  double? _convertedTemp;

  void _convertToFahrenheit() {
    double? celsius = double.tryParse(_tempController.text);
    if (celsius != null) {
      setState(() {
        _convertedTemp = celsius * 9 / 5 + 32; // Celsius to Fahrenheit conversion
      });
    } else {
      setState(() {
        _convertedTemp = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi Suhu"),
        backgroundColor: Colors.pink[300], // Warna AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Suhu dalam Celsius",
                labelStyle: TextStyle(color: Colors.pink[300]),
                filled: true,
                fillColor: Colors.pink[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.pink[300]!, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertToFahrenheit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300], // Tombol warna pink
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text("Konversi ke Fahrenheit"),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedTemp != null
                  ? "Suhu dalam Fahrenheit: ${_convertedTemp!.toStringAsFixed(2)}"
                  : "Masukkan suhu yang valid",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _convertedTemp != null
                    ? Colors.green
                    : Colors.red[400], // Warna teks berdasarkan validitas konversi
              ),
            ),
          ],
        ),
      ),
    );
  }
}
