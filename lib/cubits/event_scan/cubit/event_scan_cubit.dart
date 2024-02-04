import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:invitation/repositories/event_repository.dart';

part 'event_scan_state.dart';
part 'event_scan_cubit.freezed.dart';

class EventScanCubit extends Cubit<EventScanState> {
  EventScanCubit() : super(const EventScanState.initial());

  void scanCard(dynamic data) async {
    try {
      print("********* data  ********");
      print(data);
      print("****************************");
      emit(const EventScanState.loading());
      final response = await EventRepository().scanCard(data);
      emit(EventScanState.success(data: response));
    } catch (e) {
      emit(EventScanState.failure(errorMessage: e.toString()));
    }
  }
}
