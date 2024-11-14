import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _quantityController = TextEditingController();
  double _totalPrice = 0.0;
  String _selectedFlower = 'Mawar Merah';
  
  // Katalog bunga
  final List<Map<String, String>> _flowerCatalog = [
    {'name': 'Mawar Merah', 'price': '50000', 'image': 'assets/mawar_merah.jpg'},
    {'name': 'Tulip', 'price': '75000', 'image': 'assets/tulip.jpg'},
    {'name': 'Lily Putih', 'price': '60000', 'image': 'assets/lily_putih.jpg'},
    {'name': 'Anggrek', 'price': '80000', 'image': 'assets/anggrek.jpg'},
  ];

  void _calculatePrice() {
    final quantityText = _quantityController.text;
    final quantity = int.tryParse(quantityText);

    setState(() {
      // Menentukan harga bunga berdasarkan yang dipilih
      final selectedFlower = _flowerCatalog.firstWhere((flower) => flower['name'] == _selectedFlower);
      final pricePerFlower = double.tryParse(selectedFlower['price'] ?? '0') ?? 0;
      _totalPrice = (quantity != null && quantity > 0) ? quantity * pricePerFlower : 0.0;
    });
  }

  void _resetFields() {
    setState(() {
      _quantityController.clear();
      _totalPrice = 0.0;
      _selectedFlower = 'Mawar Merah'; // Reset pilihan bunga ke default
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Harga Bunga"),
        backgroundColor: Colors.pinkAccent[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Dropdown untuk memilih bunga
            DropdownButton<String>(
              value: _selectedFlower,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFlower = newValue!;
                });
              },
              items: _flowerCatalog.map<DropdownMenuItem<String>>((flower) {
                return DropdownMenuItem<String>(
                  value: flower['name']!,
                  child: Text(flower['name']!),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Jumlah Bunga",
                labelStyle: TextStyle(color: Colors.pinkAccent[200]),
                filled: true,
                fillColor: Colors.pinkAccent[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.pinkAccent[200]!, width: 2),
                ),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculatePrice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent[200],
                foregroundColor: Colors.white, // Warna huruf tombol
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text("Hitung Harga"),
            ),
            const SizedBox(height: 20),
            Text(
              "Total Harga: Rp ${_totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Reset
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _resetFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 179, 243, 41), // Warna tombol reset
                    foregroundColor: Colors.white, // Warna huruf tombol reset
                    minimumSize: const Size(140, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Reset"),
                ),
                // Tombol Kembali
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Tombol kembali ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Warna tombol kembali
                    foregroundColor: Colors.white, // Warna huruf tombol kembali
                    minimumSize: const Size(140, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Kembali"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
