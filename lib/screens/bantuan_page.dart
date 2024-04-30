import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(28.0),  // Rounded top left corner
          //   topRight: Radius.circular(28.0), // Rounded top right corner
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GNav(
            backgroundColor: Colors.grey.shade800,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white24,
            gap: 14,
            padding: EdgeInsets.all(16),
            selectedIndex: _selectedIndex, // Mengatur tab yang aktif
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // Perbarui nilai indeks yang dipilih
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => StopwatchPage()),
                  );
                  break;
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 2:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BantuanPage()),
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
