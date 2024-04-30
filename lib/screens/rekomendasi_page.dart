import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/models/rekomendasi_album.dart';
import 'package:tugas4tpm/screens/login_page.dart';
import 'package:tugas4tpm/widgets/rekomendasi_item.dart';

class RekomendasiPage extends StatelessWidget {
  const RekomendasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey,
        title: const Text('Rekomendasi Album'),
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
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return RekomendasiItem(
              rekomendasiAlbum: rekomendasialbumList[index],
            );
          },
          itemCount: rekomendasialbumList.length,
        ),
      ),
    );
  }
}
