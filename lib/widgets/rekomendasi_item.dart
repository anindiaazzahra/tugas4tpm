import 'package:flutter/material.dart';
import 'package:tugas4tpm/models/rekomendasi_album.dart';
import 'package:tugas4tpm/screens/rekomendasi_detail_page.dart';

class RekomendasiItem extends StatelessWidget {
  final RekomendasiAlbum rekomendasiAlbum;

  const RekomendasiItem({
    super.key,
    required this.rekomendasiAlbum,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRekomendasiPage(rekomendasiAlbum: rekomendasiAlbum),
          ),
        );
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Image.network(
                      rekomendasiAlbum.imageUrls,
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
