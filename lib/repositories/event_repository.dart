import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invitation/network/auth_header.dart';
import 'package:invitation/network/dio_client.dart';
import 'package:invitation/network/dio_exception.dart';
import 'package:invitation/network/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventRepository {
//  Future<List<Event>> fetchTransactionList(int page) async{
//     try {
//       final headers = await ApiHeader().authHeader();
//       final response = await DioClient.instance.get(
//         eventsListED,
//         queryParameters: {'page': page},
//         options: Options(headers: headers),
//       );
//       final List<Transaction> loadedTransactionList = [];

//       response['data'].forEach((value) {
//         loadedTransactionList.add(Transaction.fromJson(value));
//       });
//       return loadedTransactionList.toList();
//     } on DioError catch (e) {
//       var error = DioException.fromDioError(e);
//       throw error.errorMessage;
//     }
//   }

 
}
