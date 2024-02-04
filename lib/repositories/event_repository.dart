import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invitation/model/event_detail_model.dart';
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
      return loadedEventList.toList();
    } on DioError catch (e) {
      var error = DioException.fromDioError(e);
      throw error.errorMessage;
    }
  }

/**
 * Fetch event
 */

  Future<EventDetail> fetchEvent(String id) async {
    try {
      final headers = await ApiHeader().authHeader();
      final response = await DioClient.instance.get(
        '$eventDetailED$id',
        options: Options(headers: headers),
      );
      final eventDetail = EventDetail.fromJson(response['data']);
      return eventDetail;
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        var error = DioException.fromDioError(e);
        throw error.errorMessage;
      }
    }
  }

  /**
   * Event Scan card
   */

  Future<dynamic> scanCard(dynamic data) async {
    try {
      print("********** data scan code *****");
      print(data);
      final headers = await ApiHeader().authHeader();
      final response = await DioClient.instance.post(
        eventScanCardED,
        data: data,
        options: Options(headers: headers),
      );
      return response;
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
