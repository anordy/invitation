import 'dart:io';

import 'package:flutter/material.dart';
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
  bool _hasError = false;
  String? accessToken;
  List<EventDatum> _availableEvents = [];

// ####### GETTER  ######
  List<EventDatum> get availableEvents => _availableEvents;
  bool get isLoading => _isLoading;

  // **** fetch Events *****
  Future<void> fetchEvents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.accessToken = sharedPreferences.getString("accessToken");
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
        print("******  Error from fetching Deals ******");
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
}
