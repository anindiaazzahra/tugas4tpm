import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  Future writeCache({required String key, required String value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    bool isSaved = await pref.setString(key, value);

    debugPrint(isSaved.toString());
  }

  Future<String?> readCache({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? value = pref.getString(key);

    if(value != null){
      value;
    }
    return null;
  }
}