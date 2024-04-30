import 'package:flutter/material.dart';
import 'package:tugas4tpm/screens/favorite_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugas4tpm/models/rekomendasi_album.dart';

class DetailRekomendasiPage extends StatefulWidget {
  final RekomendasiAlbum rekomendasiAlbum;

  const DetailRekomendasiPage({
    Key? key,
    required this.rekomendasiAlbum,
  }) : super(key: key);

  @override
  State<DetailRekomendasiPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailRekomendasiPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  void _checkIfFavorite() async {
    final isFavorited = await FavoriteManager.isAlbumFavorited(widget.rekomendasiAlbum.albumName);
    setState(() {
      isFavorite = isFavorited;
    });
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    FavoriteManager.toggleFavoriteAlbum(widget.rekomendasiAlbum.albumName);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite ? 'Added to favorites' : 'Removed from favorites'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rekomendasiAlbum.albumName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: SizedBox(
                height: 300,
                child: Image.network(widget.rekomendasiAlbum.imageUrls),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    widget.rekomendasiAlbum.albumName,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.rekomendasiAlbum.singer,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 30.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          Expanded(
                            child: Text(
                              widget.rekomendasiAlbum.firstEntryDate,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Text(
                            "| ",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const Icon(Icons.home_work_outlined),
                          Expanded(
                            child: Text(
                              widget.rekomendasiAlbum.source,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 112),
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(widget.rekomendasiAlbum.albumurl);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.white10),
                  ),
                  minimumSize: const Size(50, 40),
                  backgroundColor: Colors.white30,
                ),
                child: const Text(
                  'Open in Browser',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Song List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.rekomendasiAlbum.songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          widget.rekomendasiAlbum.songs[index],
                          // style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Error cannot launch $url';
  }
}
