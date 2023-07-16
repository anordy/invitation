import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/auth_response.dart';
import '../api.dart';

class AuthProvider extends ChangeNotifier {
  // variable
  bool _isLoading = false;
  bool _hasError = false;
  late AuthResponse _authResponse;
  // getters

  AuthResponse get authResponce => _authResponse;
  bool get isLoading => _isLoading;

// Login connection
  Future<bool> login({required String phone, required String password}) async {
    print({"phone_number": phone, "password": password});

    _isLoading = false;
    _hasError = true;

    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> data = {"phone_number": phone, "password": password};
    var url = Uri.parse(api + "login");
    final response = await http.post(url,
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data));
    try {
      if (response.statusCode == 200) {
        var result = authResponseFromJson(response.body);
        print("******* Auth Response ******");
        print(result.data.user.name);
        sharedPreferences.setString("username", result.data.user.name);
        sharedPreferences.setString("phone", result.data.user.phoneNumber);
        sharedPreferences.setString("accessToken", result.data.token);
        sharedPreferences.setBool("isLoggedIn", true);

        _isLoading = false;
        _hasError = false;
        notifyListeners();
      } else {
        _isLoading = false;
        _hasError = true;
        print("**** Error from  login  ****");
        var result = authResponseFromJson(response.body);
        _authResponse = result;
        print(_authResponse.message);
        notifyListeners();
      }
    } catch (e) {
      print("catch");
      _hasError = true;
      _isLoading = false;
      print(e);
    }
    return _hasError;
  }
}
