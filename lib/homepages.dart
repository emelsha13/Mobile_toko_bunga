import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> flowers = [
      {'name': 'Mawar Merah', 'price': 'Rp 50.000', 'image': 'assets/mawar_merah.jpg'},
      {'name': 'Tulip', 'price': 'Rp 75.000', 'image': 'assets/tulip.jpg'},
      {'name': 'Lily Putih', 'price': 'Rp 60.000', 'image': 'assets/lily_putih.jpg'},
      {'name': 'Anggrek', 'price': 'Rp 80.000', 'image': 'assets/anggrek.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko Bunga"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: flowers.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      flowers[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    flowers[index]['name']!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    flowers[index]['price']!,
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
