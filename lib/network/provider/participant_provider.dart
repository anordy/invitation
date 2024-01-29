import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:invitation/model/auth_response.dart';
import 'package:invitation/model/check_card_model.dart';
import 'package:invitation/model/event_detail_model.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/model/participant_model.dart';
import 'package:invitation/network/api.dart';
import 'package:http/http.dart' as http;
import 'package:invitation/utils/colors.dart';
import 'package:invitation/widget/toast_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParticipantProvider extends ChangeNotifier {
  ParticipantProvider() {
    fetchParticipants();
  }

  // ####### VARIABLE  ######

  bool _isLoading = false;
  bool? _isParticipantLoading;
  late bool _isEventDetailLoading;
  bool _hasError = false;
  String? accessToken;
  ParticipantModel? _availableEventDetail;
  List<Participant> _availableParticipant = [];

// ####### GETTER  ######
  List<Participant> get availableEvents => _availableParticipant;
  // EventDetail? get availableEventDetail => _availableEventDetail;
  bool get isLoading => _isLoading;
  bool get isEventDetailLoading => _isEventDetailLoading;

  // **** fetch Events *****
  Future<void> fetchParticipants() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.accessToken = sharedPreferences.getString("accessToken");
    print("*************  access token from Event ******");
    print(this.accessToken);
    bool hasError = true;
    _isParticipantLoading = true;
    notifyListeners();

    var url = Uri.parse(api + "event/attended/guests/1");
    final http.Response response =
        await http.get(url, headers: <String, String>{
      "Accept": "Application/json",
      "Authorization": "Bearer $accessToken",
    });
    print("****** response from Participants *******");
    print(response.body);
    print("****************************");
    try {
      if (response.statusCode == 200) {
        final result = participantModelFromJson(response.body);
        print(result);
        _availableParticipant = result.data;
        print("======  available Participant ====");
        print(_availableParticipant);
        _isParticipantLoading = false;

        notifyListeners();
      } else {
        print("******  Error from fetching Events ******");
        hasError = true;
        _isParticipantLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print("******* error on fetching Events *****");
      print(e);
      hasError = true;
      _isParticipantLoading = false;
      notifyListeners();
    }
    // _availableEvents = false;
    notifyListeners();
  }
}
