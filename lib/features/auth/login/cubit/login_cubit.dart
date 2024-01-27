import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invitation/repositories/auth_repository.dart';


part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  void login(dynamic data) async {
    try {
      emit(const LoginState.loading());
      final response = await AuthRepository().login(data);
      emit(LoginState.success(user: response));
    } catch (e) {
      emit(LoginState.failure(errorMessage: e.toString()));
    }
  }
}
