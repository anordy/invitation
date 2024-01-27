import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiHeader {
  Future<Map<String, String>> authHeader() async {
    final prefs = await SharedPreferences.getInstance();

    final userData = json.decode(prefs.getString('user')!);

    final token = userData['token'];

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    return headers;
  }
}
