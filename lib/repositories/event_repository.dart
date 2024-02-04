import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/network/auth_header.dart';
import 'package:invitation/network/dio_client.dart';
import 'package:invitation/network/dio_exception.dart';
import 'package:invitation/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventRepository {
  /**
   * Fetch all Events
   */

  Future<List<EventDatum>> fetchEventLists() async {
    try {
      final headers = await ApiHeader().authHeader();
      final response = await DioClient.instance.get(
        eventsListED,
        options: Options(headers: headers),
      );
      final List<EventDatum> loadedEventList = [];

      response['data'].forEach((value) {
        loadedEventList.add(EventDatum.fromJson(value));
      });
      print("**** event lists ****");
      print(loadedEventList);
      print("*********************");

      return loadedEventList.toList();
    } on DioError catch (e) {
      var error = DioException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
