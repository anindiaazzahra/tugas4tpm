import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/screens/bantuan_page.dart';
import 'package:tugas4tpm/screens/bil_prima_page.dart';
import 'package:tugas4tpm/screens/favorite_page.dart';
import 'package:tugas4tpm/screens/kelompok_page.dart';
import 'package:tugas4tpm/screens/login_page.dart';
import 'package:tugas4tpm/screens/rekomendasi_page.dart';
import 'package:tugas4tpm/screens/segitiga_page.dart';
import 'package:tugas4tpm/screens/stopwatch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Indeks tab yang aktif saat ini

  Widget _customElevatedButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.white10),
          ),
          minimumSize: const Size(320, 54),
          backgroundColor: Colors.white24,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Welcome, ${finalEmail!.split('@').first}!',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _customElevatedButton(
                text: 'Daftar Anggota',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DataKelompokPage()),
                  );
                },
              ),
              _customElevatedButton(
                text: 'Check bilangan prima',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BilPrimaPage()),
                  );
                },
              ),
              _customElevatedButton(
                text: 'Hitung Luas dan keliling segitiga',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SegitigaPage()),
                  );
                },
              ),
              _customElevatedButton(
                text: 'Daftar Situs Rekomendasi',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RekomendasiPage()),
                  );
                },
              ),
              _customElevatedButton(
                text: 'Favorite',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavoritePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GNav(
            backgroundColor: Colors.grey.shade800,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white24,
            gap: 14,
            padding: const EdgeInsets.all(16),
            selectedIndex: _selectedIndex, // Mengatur tab yang aktif
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // Perbarui nilai indeks yang dipilih
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StopwatchPage()),
                  );
                  break;
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  break;
                case 2:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BantuanPage()),
                  );
                  break;
              }
            },
            tabs: const [
              GButton(
                icon: Icons.timer_outlined,
                text: 'Stopwatch',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.live_help_outlined,
                text: 'Bantuan',
              )
            ],
          ),
        ),
      ),
    );
  }
}