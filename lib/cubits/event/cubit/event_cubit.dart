import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:invitation/model/event_detail_model.dart';
import 'package:invitation/repositories/event_repository.dart';

part  'event_state.dart';
part  'event_cubit.freezed.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(const EventState.initial());

  void fetchEvent(String id) async {
    try {
      emit(const EventState.loading());
      final response = await EventRepository().fetchEvent(id);
      emit(EventState.success(eventDetail: response));
    } catch (e) {
      emit(EventState.failure(errorMessage: e.toString()));
    }
  }
}
