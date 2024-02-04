
part of 'event_list_cubit.dart';

@freezed
class EventListState with _$EventListState {
  const factory EventListState.initial() = _Initial;
  const factory EventListState.loading() = _Loading;
  const factory EventListState.success({ required List<EventDatum> events }) = _Success;
  const factory EventListState.failure({ required String errorMessage }) = _Failure;
}