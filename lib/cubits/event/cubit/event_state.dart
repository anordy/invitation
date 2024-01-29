part of 'event_cubit.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = _Initial;
  const factory EventState.loading() = _EventStateLoading;
  const factory EventState.success({ required dynamic user }) = _EventStateSuccess;
  const factory EventState.failure({ required String errorMessage }) = _EventStateFailure;
}
