import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/screens/home_page.dart';
import 'package:tugas4tpm/screens/login_page.dart';

import 'stopwatch_page.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({super.key});

  @override
  State<BantuanPage> createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  int _selectedIndex = 2; // Indeks tab yang aktif saat ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '1. Ketika di Halaman Login masukkan username dan password.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '2. Terdapat 3 Menu pada Bottom Navigation Bar (Home, StopWatch, Bantuan)',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '3. Terdapat 5 Menu pada halaman Home (Daftar Anggota, Check bilangan prima, Hitung luas dan keliling Segitiga, Daftar Situs Rekomendasi, Favorite)',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '4. Menu StopWatch berisikan fitur yang dapat digunakan sebagai alat StopWatch',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '5. Menu Bantuan menampilkan cara penggunaan aplikasi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '6. Menu Daftar Anggota berisi Nama dan NIM angota yang mengerjakan aplikasi ini',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '7. Menu Check Bilangan Prima berguna untuk mengecek suatu Bilangan termasuk Prima atau tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '8. Menu Hitung luas dan keliling Segitiga berguna untuk menghitung luas dan keliling Segitiga dengan akurat',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '9. Menu Daftar Situs Rekomendasi menampilkan Rekomendasi Album',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '10. Menu Favorite menampilkan Album yang telah diberi checkmark favorite pada menu Daftar Situs Rekomendasi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '11. Terdapat Menu Logout di pojok kanan atas untuk logout dari Aplikasi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
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
