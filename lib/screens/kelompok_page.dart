import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/screens/login_page.dart';

class DataKelompokPage extends StatefulWidget {
  const DataKelompokPage({super.key});

  @override
  State<DataKelompokPage> createState() => _DataKelompokPageState();
}

class _DataKelompokPageState extends State<DataKelompokPage> {

  @override
  Widget build(BuildContext context) {
    List<String> dataKelompok = [
      "123210072 - Anindia Azzahra",
      "123210190 - Frederick Roberto Wifani",
    ];
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 35);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Kelompok"),
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
      body: Padding(
        padding: padding,
        child: ListView.builder(
          itemCount: dataKelompok.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.white10,
                child: ListTile(
                  title: Text(
                    dataKelompok[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}