import 'package:flutter/material.dart';
import 'package:tugas4tpm/models/rekomendasi_album.dart';
import 'package:tugas4tpm/screens/favorite_manager.dart';
import 'package:tugas4tpm/screens/rekomendasi_detail_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<RekomendasiAlbum> favoriteAlbums = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteAlbums();
  }

  Future<void> _loadFavoriteAlbums() async {
    final List<String> favoriteAlbumNames = await FavoriteManager.getFavoriteAlbums();
    final List<RekomendasiAlbum> albums = rekomendasialbumList.where((album) => favoriteAlbumNames.contains(album.albumName)).toList();
    setState(() {
      favoriteAlbums = albums;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Albums'),
      ),
      body: ListView.builder(
        itemCount: favoriteAlbums.length,
        itemBuilder: (context, index) {
          final album = favoriteAlbums[index];
          return ListTile(
            title: Text(album.albumName),
            subtitle: Text(album.singer),
            leading: Image.network(album.imageUrls),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailRekomendasiPage(rekomendasiAlbum: album),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
