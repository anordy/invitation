part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _LoginStateLoading;
  const factory LoginState.success({ required dynamic user }) = _LoginStateSuccess;
  const factory LoginState.failure({ required String errorMessage }) = _LoginStateFailure;
}
