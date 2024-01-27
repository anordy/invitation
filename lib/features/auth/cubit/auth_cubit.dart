import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }

  void isAuthenticated() async {
    emit(const AuthState.loading());

    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user')) {
      final extractedUserData =
          json.decode(prefs.getString('user')!) as Map<String, dynamic>;
      // final expiryIn = extractedUserData['expires_in'];

      // final now = DateTime.now().toUtc().millisecondsSinceEpoch;

      // if (expiryIn < now / 1000) {
        // emit(const AuthState.success(isAuth: false));
      // } else {
        emit(const AuthState.success(isAuth: true));
      // }
    } else {
      emit(const AuthState.success(isAuth: false));
    }
  }
}
