part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.success({required bool isAuth}) = _AuthStateSuccess;
  const factory AuthState.failure({required String errorMessage}) =
      _AuthStateFailure;
}
