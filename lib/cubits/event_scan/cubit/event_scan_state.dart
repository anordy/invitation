
part of 'event_scan_cubit.dart';

@freezed
class EventScanState with _$EventScanState {
  const factory EventScanState.initial() = _Initial;
  const factory EventScanState.loading() = _Loading;
  const factory EventScanState.success({ required CheckCardModel data }) = _Success;
  const factory EventScanState.failure({ required String errorMessage }) = _Failure;
}