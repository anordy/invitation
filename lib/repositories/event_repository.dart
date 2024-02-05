import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invitation/model/event_detail_model.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/network/auth_header.dart';
import 'package:invitation/network/dio_client.dart';
import 'package:invitation/network/dio_exception.dart';
import 'package:invitation/network/endpoints.dart';
import 'package:invitation/widget/toast_widget.dart';
import 'package:oktoast/oktoast.dart';
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
      showToastWidget(
            LoggedInToast(
              icon: Icon(
                Icons.done,
                color: Colors.white,
                size: 15,
              ),
              height: 50,
              width: 200,
              color: Colors.white,
              bgColor: Colors.green,
              description: "User checked success"),
          duration: const Duration(seconds: 15),
          position: ToastPosition.top,
        );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
           showToastWidget(
            LoggedInToast(
              icon: Icon(
                Icons.done,
                color: Colors.white,
                size: 15,
              ),
              height: 50,
              width: 200,
              color: Colors.white,
              bgColor: Colors.green,
              description: e.response!.data['message']),
          duration: const Duration(seconds: 15),
          position: ToastPosition.top,
        );
        throw e.response!.data['message'];
      } else {
                var error = DioException.fromDioError(e);
          showToastWidget(
            LoggedInToast(
              icon: Icon(
                Icons.done,
                color: Colors.white,
                size: 15,
              ),
              height: 50,
              width: 200,
              color: Colors.white,
              bgColor: Colors.green,
              description: error.errorMessage),
          duration: const Duration(seconds: 15),
          position: ToastPosition.top,
        );
        throw error.errorMessage;
       
      }
    }
  }
}
