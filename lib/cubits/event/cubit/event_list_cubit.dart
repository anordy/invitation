import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/repositories/event_repository.dart';

part  'event_list_state.dart';
part  'event_list_cubit.freezed.dart';

class EventListCubit extends Cubit<EventListState> {
  EventListCubit() : super(const EventListState.initial());

  void fetchEventLists() async {
    try {
      emit(const EventListState.loading());
      final response = await EventRepository().fetchEventLists();
      emit(EventListState.success(events: response));
    } catch (e) {
      emit(EventListState.failure(errorMessage: e.toString()));
    }
  }
}
