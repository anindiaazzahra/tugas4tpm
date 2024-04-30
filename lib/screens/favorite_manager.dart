import 'package:shared_preferences/shared_preferences.dart';

class FavoriteManager {
  static const _key = 'favorite_albums';

  static Future<List<String>> getFavoriteAlbums() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> toggleFavoriteAlbum(String albumName) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAlbums = prefs.getStringList(_key) ?? [];

    if (favoriteAlbums.contains(albumName)) {
      favoriteAlbums.remove(albumName);
    } else {
      favoriteAlbums.add(albumName);
    }

    await prefs.setStringList(_key, favoriteAlbums);
  }

  static Future<bool> isAlbumFavorited(String albumName) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAlbums = prefs.getStringList(_key) ?? [];
    return favoriteAlbums.contains(albumName);
  }
}
