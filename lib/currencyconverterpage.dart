import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  double _convertedAmount = 0.0;

  void _convertToRupiah() {
    double usd = double.tryParse(_amountController.text) ?? 0;
    setState(() {
      _convertedAmount = usd * 15000; // Assuming exchange rate of 1 USD = 15,000 IDR
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi Mata Uang"),
        backgroundColor: Colors.pink[300], // Warna AppBar yang lembut dan sesuai tema
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Jumlah dalam USD",
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
              onPressed: _convertToRupiah,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300], // Warna tombol yang konsisten
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text("Konversi ke Rupiah"),
            ),
            const SizedBox(height: 20),
            Text(
              "Jumlah dalam Rupiah: Rp ${_convertedAmount.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _convertedAmount > 0
                    ? Colors.green
                    : Colors.red[400], // Menggunakan warna hijau jika ada hasil konversi
              ),
            ),
          ],
        ),
      ),
    );
  }
}
