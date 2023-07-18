import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invitation/model/event_detail_model.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/network/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EventProvider extends ChangeNotifier {
  EventProvider() {
    fetchEvents();
  }

  // ####### VARIABLE  ######

  bool _isLoading = false;
  bool? _isEventLoading;
  late bool _isEventDetailLoading;
  bool _hasError = false;
  String? accessToken;
  EventDetail? _availableEventDetail;
  List<EventDatum> _availableEvents = [];

// ####### GETTER  ######
  List<EventDatum> get availableEvents => _availableEvents;
  EventDetail? get availableEventDetail => _availableEventDetail;
  bool get isLoading => _isLoading;
  bool get isEventDetailLoading => _isEventDetailLoading;

  // **** fetch Events *****
  Future<void> fetchEvents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.accessToken = "33|o1EVf5ANHFi8hCJTkTOZsCsbYF6Kbbh2WvZzHZR2";
    print("*************  access token from Event ******");
    print(this.accessToken);
    bool hasError = true;
    _isEventLoading = true;
    notifyListeners();

    var url = Uri.parse(api + "events");
    final http.Response response =
        await http.get(url, headers: <String, String>{
      "Accept": "Application/json",
      "Authorization": "Bearer $accessToken",
    });
    print("****** response from Events *******");
    print(response.body);
    print("****************************");
    try {
      if (response.statusCode == 200) {
        final result = eventModelFromJson(response.body);
        print(result);
        _availableEvents = result.data;
        print("======  available Events ====");
        print(availableEvents);
        _isEventLoading = false;

        notifyListeners();
      } else {
        print("******  Error from fetching Events ******");
        hasError = true;
        _isEventLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print("******* error on fetching Events *****");
      print(e);
      hasError = true;
      _isEventLoading = false;
      notifyListeners();
    }
    // _availableEvents = false;
    notifyListeners();
  }

  // **** fetch Event by Id *****
  Future<void> fetchEventDetail({required String id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.accessToken = "33|o1EVf5ANHFi8hCJTkTOZsCsbYF6Kbbh2WvZzHZR2";
    print("*************  access token from Event ******");
    print(this.accessToken);
    bool hasError = true;
    _isEventDetailLoading = true;
    notifyListeners();

    var url = Uri.parse(api + "event/details/${id}");
    final http.Response response =
        await http.get(url, headers: <String, String>{
      "Accept": "Application/json",
      "Authorization": "Bearer $accessToken",
    });

    print("****** response from Event Detail By id *******");
    print(response.body);
    print("****************************");

    try {
      if (response.statusCode == 200) {
        _availableEventDetail = eventDetailFromJson(response.body);
        print("======  available Events By id ====");
        print(_availableEventDetail);
        _isEventDetailLoading = false;

        notifyListeners();
      } else {
        print("******  Error from fetching Events ******");
        hasError = true;
        _isEventDetailLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print("******* error on fetching Events *****");
      print(e);
      hasError = true;
      _isEventDetailLoading = false;
      notifyListeners();
    }
    // _availableEvents = false;
    notifyListeners();
  }
}
