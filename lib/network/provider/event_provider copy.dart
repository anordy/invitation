// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:invitation/model/auth_response.dart';
// import 'package:invitation/model/check_card_model.dart';
// import 'package:invitation/model/event_detail_model.dart';
// import 'package:invitation/model/event_model.dart';
// import 'package:invitation/network/api.dart';
// import 'package:http/http.dart' as http;
// import 'package:invitation/utils/colors.dart';
// import 'package:invitation/widget/toast_widget.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:oktoast/oktoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class EventProvider extends ChangeNotifier {
//   EventProvider() {
//     fetchEvents();
//   }

//   // ####### VARIABLE  ######

//   bool _isLoading = false;
//   bool? _isEventLoading;
//   late bool _isEventDetailLoading;
//   bool _hasError = false;
//   String? accessToken;
//   EventDetail? _availableEventDetail;
//   List<EventDatum> _availableEvents = [];

// // ####### GETTER  ######
//   List<EventDatum> get availableEvents => _availableEvents;
//   EventDetail? get availableEventDetail => _availableEventDetail;
//   bool get isLoading => _isLoading;
//   bool get isEventDetailLoading => _isEventDetailLoading;

//   // **** fetch Events *****
//   Future<void> fetchEvents() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     this.accessToken = sharedPreferences.getString("accessToken");
//     print("*************  access token from Event ******");
//     print(this.accessToken);
//     bool hasError = true;
//     _isEventLoading = true;
//     notifyListeners();

//     var url = Uri.parse(api + "events");
//     final http.Response response =
//         await http.get(url, headers: <String, String>{
//       "Accept": "Application/json",
//       "Authorization": "Bearer $accessToken",
//     });
//     print("****** response from Events *******");
//     print(response.body);
//     print("****************************");
//     try {
//       if (response.statusCode == 200) {
//         final result = eventModelFromJson(response.body);
//         print(result);
//         _availableEvents = result.data;
//         print("======  available Events ====");
//         print(_availableEvents);
//         _isEventLoading = false;

//         notifyListeners();
//       } else {
//         print("******  Error from fetching Events ******");
//         hasError = true;
//         _isEventLoading = false;
//         notifyListeners();
//       }
//     } catch (e) {
//       print("******* error on fetching Events *****");
//       print(e);
//       hasError = true;
//       _isEventLoading = false;
//       notifyListeners();
//     }
//     // _availableEvents = false;
//     notifyListeners();
//   }

//   // **** fetch Event by Id *****
//   Future<void> fetchEventDetail({required String id}) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     this.accessToken = sharedPreferences.getString("accessToken");
//     print("*************  access token from Event ******");
//     print(this.accessToken);
//     bool hasError = true;
//     _isEventDetailLoading = true;
//     notifyListeners();

//     var url = Uri.parse(api + "event/details/${id}");
//     final http.Response response =
//         await http.get(url, headers: <String, String>{
//       "Accept": "Application/json",
//       "Authorization": "Bearer $accessToken",
//     });

//     print("****** response from Event Detail By id *******");
//     print(response.body);
//     print("****************************");

//     try {
//       if (response.statusCode == 200) {
//         _availableEventDetail = eventDetailFromJson(response.body);
//         print("======  available Events By id ====");
//         print(_availableEventDetail);
//         _isEventDetailLoading = false;

//         notifyListeners();
//       } else {
//         print("******  Error from fetching Events ******");
//         hasError = true;
//         _isEventDetailLoading = false;
//         notifyListeners();
//       }
//     } catch (e) {
//       print("******* error on fetching Events *****");
//       print(e);
//       hasError = true;
//       _isEventDetailLoading = false;
//       notifyListeners();
//     }
//     // _availableEvents = false;
//     notifyListeners();
//   }

//   /**
//    * Card check
//    */

//   Future<bool> checkCard({required String pin, required int eventId}) async {
//     print({"pin": pin, "event_id": eventId});
//     _isLoading = false;
//     _hasError = true;

//     notifyListeners();
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     Map<String, dynamic> data = {"pin": pin, "event_id": eventId};
//     var url = Uri.parse(api + "scan/invitation/card");
//     final response = await http.post(url,
//         headers: <String, String>{
//           "Accept": "application/json",
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $accessToken",
//         },
//         body: jsonEncode(data));
//     try {
//       var result = checkCardModelFromJson(response.body);
//       if (result.code == 200) {
//         print("******* scan card results ******");
//         print(result.message);
//         print("**********************");
//         _isLoading = false;
//         _hasError = false;
        
//             showToastWidget(
//               LoggedInToast(
//                   icon: const Icon(
//                     Icons.done,
//                     color: Colors.white,
//                     size: 15,
//                   ),
//                   height: 50,
//                   width: 200,
//                   color: Colors.white,
//                   bgColor: Colors.green,
//                   description: "User check-in successful!"),
//               duration: const Duration(seconds: 2),
//               position: ToastPosition.top,
//             );
//         notifyListeners();
//       } else if(result.code == 422) {
//         print("******* Verify card scanned ******");
//         print(result.message);
//         print("**********************");
//         _isLoading = false;
//         _hasError = false;
       
//           showToastWidget(
//               LoggedInToast(
//                   icon: const Icon(
//                     Icons.close,
//                     color: Colors.red,
//                     size: 15,
//                   ),
//                   height: 50,
//                   width: 200,
//                   color: Colors.white,
//                   bgColor: Colors.red,
//                   description: "User is already marked as checked in"),
//               duration: const Duration(seconds: 2),
//               position: ToastPosition.top,
//             );
//         notifyListeners();
//       }
//        else {
//         _isLoading = false;
//         _hasError = true;

//         notifyListeners();
//       }
//     } catch (e) {
//       print("catch");
//       _hasError = true;
//       _isLoading = false;
//       print(e);
//     }
//     return _hasError;
//   }
// }
