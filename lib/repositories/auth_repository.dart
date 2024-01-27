import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invitation/network/dio_client.dart';
import 'package:invitation/network/dio_exception.dart';
import 'package:invitation/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  // Future<dynamic> resetPasswordByPhone(dynamic data) async {
  //   try {
  //     final response = await DioClient.instance.post(
  //       resetPasswordByPhoneED,
  //       data: data,
  //       options: Options(
  //         headers: {'Accept': 'application/json'},
  //       ),
  //     );
  //     return response;
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       throw e.response!.data['message'];
  //     } else {
  //       var error = DioException.fromDioError(e);
  //       throw error.errorMessage;
  //     }
  //   }
  // }

  // Future<dynamic> forgotPasswordByPhone(dynamic data) async {
  //   try {
  //     final response = await DioClient.instance.post(
  //       forgotPasswordByPhoneED,
  //       data: data,
  //       options: Options(
  //         headers: {'Accept': 'application/json'},
  //       ),
  //     );
  //     return response;
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       throw e.response!.data['message'];
  //     } else {
  //       var error = DioException.fromDioError(e);
  //       throw error.errorMessage;
  //     }
  //   }
  // }

  Future<dynamic> login(dynamic data) async {
    try {
      final response = await DioClient.instance.post(
        loginED,
        data: data,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      final userData = response['data'];
      print("****************************");
      // print(userData.user.name);
      // save the user data to shared preferences
      final prefs = await SharedPreferences.getInstance();
      final user = json.encode({
        'id': userData['id'],
        'username': userData['username'],
        'phone_number': userData['phone_number'],
        'token': userData['token'],
      });

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

  // Future<User> signup(dynamic data) async {
  //   try {
  //     final response = await DioClient.instance.post(
  //       signupED,
  //       data: data,
  //       options: Options(headers: {'Accept': 'application/json'}),
  //     );

  //     final userData = response['data'];

  //     final User user = User.fromJson(userData);

  //     return user;
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       throw e.response!.data['message'];
  //     } else {
  //       var error = DioException.fromDioError(e);
  //       throw error.errorMessage;
  //     }
  //   }
  // }
}
