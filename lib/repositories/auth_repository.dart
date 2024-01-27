import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invitation/network/dio_client.dart';
import 'package:invitation/network/dio_exception.dart';
import 'package:invitation/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
 Future<dynamic> login(dynamic data) async {
    try {
      final response = await DioClient.instance.post(
        loginED,
        data: data,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      final userData = response['data']['user'];
      final responceData = response['data'];

      // save the user data to shared preferences
      final prefs = await SharedPreferences.getInstance();
      final user = json.encode({
        'id': userData['id'],
        'name': userData['name'],
        'email': userData['email'],
        'phone_number': userData['phone_number'],
        'token': responceData['token'],
      });
       print(user);


      prefs.setString('user', user);

      return userData;
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        var error = DioException.fromDioError(e);
        throw error.errorMessage;
      }
    }
  }

 
}
