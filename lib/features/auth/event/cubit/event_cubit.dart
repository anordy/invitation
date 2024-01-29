import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invitation/repositories/auth_repository.dart';
import 'package:invitation/repositories/event_repository.dart';


part 'event_state.dart';
part 'event_cubit.freezed.dart';


class EventCubit extends Cubit<EventState> {
  EventCubit() : super(const EventState.initial());

  void login(dynamic data) async {
    try {
      emit(const EventState.loading());
      final response = await EventRepository().fetch(data);
      emit(EventState.success(user: response));
    } catch (e) {
      emit(EventState.failure(errorMessage: e.toString()));
    }
  }
}
