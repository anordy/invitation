
part of 'event_cubit.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = _Initial;
  const factory EventState.loading() = _Loading;
  const factory EventState.success({ required EventDetail eventDetail }) = _Success;
  const factory EventState.failure({ required String errorMessage }) = _Failure;
}