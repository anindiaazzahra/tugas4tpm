import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import 'package:tugas4tpm/screens/login_page.dart';

class SegitigaPage extends StatefulWidget {
  const SegitigaPage({super.key});

  @override
  _TriangleCalculatorPageState createState() => _TriangleCalculatorPageState();
}

class _TriangleCalculatorPageState extends State<SegitigaPage> {
  final TextEditingController sisiAController = TextEditingController();
  final TextEditingController sisiBController = TextEditingController();
  final TextEditingController sisiCController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  String luas = '';
  String keliling = '';

  void _calculate() {
    double sisiA = double.tryParse(sisiAController.text) ?? 0;
    double sisiB = double.tryParse(sisiBController.text) ?? 0;
    double sisiC = double.tryParse(sisiCController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;
    double l = 0;
    
    if (tinggi != 0) {
      l = 0.5 * sisiA * tinggi;
    } else {
      // Luas Segitiga (Rumus Heron) -> Jika tidak diketahui tinggi
      double s = (sisiA + sisiB + sisiC) / 2;
      l = math.sqrt(s * (s - sisiA) * (s - sisiB) * (s - sisiC));
    }

    // Keliling Segitiga
    double k = sisiA + sisiB + sisiC;

    setState(() {
      luas= l.toStringAsFixed(2);
      keliling = k.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segitiga Kalkulator'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () async {
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('email');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: sisiAController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Sisi A'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: sisiBController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Sisi B'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: sisiCController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Sisi C'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Tinggi'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 60),
                ),
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Luas\n$luas',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Keliling\n$keliling',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
