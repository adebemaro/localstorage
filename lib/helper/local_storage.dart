import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  storeToken(String token) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString("auth", jsonEncode(token));
  }

  logOut() async {
    final storage = await SharedPreferences.getInstance();
    await storage.remove("auth");
  }
}
