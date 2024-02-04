// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic user) success,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic user)? success,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic user)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginStateLoading value) loading,
    required TResult Function(_LoginStateSuccess value) success,
    required TResult Function(_LoginStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginStateLoading value)? loading,
    TResult? Function(_LoginStateSuccess value)? success,
    TResult? Function(_LoginStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginStateLoading value)? loading,
    TResult Function(_LoginStateSuccess value)? success,
    TResult Function(_LoginStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic user) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic user)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic user)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginStateLoading value) loading,
    required TResult Function(_LoginStateSuccess value) success,
    required TResult Function(_LoginStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginStateLoading value)? loading,
    TResult? Function(_LoginStateSuccess value)? success,
    TResult? Function(_LoginStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginStateLoading value)? loading,
    TResult Function(_LoginStateSuccess value)? success,
    TResult Function(_LoginStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoginStateLoadingImplCopyWith<$Res> {
  factory _$$LoginStateLoadingImplCopyWith(_$LoginStateLoadingImpl value,
          $Res Function(_$LoginStateLoadingImpl) then) =
      __$$LoginStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateLoadingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateLoadingImpl>
    implements _$$LoginStateLoadingImplCopyWith<$Res> {
  __$$LoginStateLoadingImplCopyWithImpl(_$LoginStateLoadingImpl _value,
      $Res Function(_$LoginStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginStateLoadingImpl implements _LoginStateLoading {
  const _$LoginStateLoadingImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic user) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic user)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic user)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginStateLoading value) loading,
    required TResult Function(_LoginStateSuccess value) success,
    required TResult Function(_LoginStateFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginStateLoading value)? loading,
    TResult? Function(_LoginStateSuccess value)? success,
    TResult? Function(_LoginStateFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginStateLoading value)? loading,
    TResult Function(_LoginStateSuccess value)? success,
    TResult Function(_LoginStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoginStateLoading implements LoginState {
  const factory _LoginStateLoading() = _$LoginStateLoadingImpl;
}

/// @nodoc
abstract class _$$LoginStateSuccessImplCopyWith<$Res> {
  factory _$$LoginStateSuccessImplCopyWith(_$LoginStateSuccessImpl value,
          $Res Function(_$LoginStateSuccessImpl) then) =
      __$$LoginStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic user});
}

/// @nodoc
class __$$LoginStateSuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateSuccessImpl>
    implements _$$LoginStateSuccessImplCopyWith<$Res> {
  __$$LoginStateSuccessImplCopyWithImpl(_$LoginStateSuccessImpl _value,
      $Res Function(_$LoginStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$LoginStateSuccessImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$LoginStateSuccessImpl implements _LoginStateSuccess {
  const _$LoginStateSuccessImpl({required this.user});

  @override
  final dynamic user;

  @override
  String toString() {
    return 'LoginState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateSuccessImpl &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateSuccessImplCopyWith<_$LoginStateSuccessImpl> get copyWith =>
      __$$LoginStateSuccessImplCopyWithImpl<_$LoginStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic user) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic user)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic user)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginStateLoading value) loading,
    required TResult Function(_LoginStateSuccess value) success,
    required TResult Function(_LoginStateFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginStateLoading value)? loading,
    TResult? Function(_LoginStateSuccess value)? success,
    TResult? Function(_LoginStateFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginStateLoading value)? loading,
    TResult Function(_LoginStateSuccess value)? success,
    TResult Function(_LoginStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LoginStateSuccess implements LoginState {
  const factory _LoginStateSuccess({required final dynamic user}) =
      _$LoginStateSuccessImpl;

  dynamic get user;
  @JsonKey(ignore: true)
  _$$LoginStateSuccessImplCopyWith<_$LoginStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStateFailureImplCopyWith<$Res> {
  factory _$$LoginStateFailureImplCopyWith(_$LoginStateFailureImpl value,
          $Res Function(_$LoginStateFailureImpl) then) =
      __$$LoginStateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$LoginStateFailureImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateFailureImpl>
    implements _$$LoginStateFailureImplCopyWith<$Res> {
  __$$LoginStateFailureImplCopyWithImpl(_$LoginStateFailureImpl _value,
      $Res Function(_$LoginStateFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$LoginStateFailureImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginStateFailureImpl implements _LoginStateFailure {
  const _$LoginStateFailureImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'LoginState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateFailureImplCopyWith<_$LoginStateFailureImpl> get copyWith =>
      __$$LoginStateFailureImplCopyWithImpl<_$LoginStateFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic user) success,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic user)? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic user)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginStateLoading value) loading,
    required TResult Function(_LoginStateSuccess value) success,
    required TResult Function(_LoginStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginStateLoading value)? loading,
    TResult? Function(_LoginStateSuccess value)? success,
    TResult? Function(_LoginStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginStateLoading value)? loading,
    TResult Function(_LoginStateSuccess value)? success,
    TResult Function(_LoginStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _LoginStateFailure implements LoginState {
  const factory _LoginStateFailure({required final String errorMessage}) =
      _$LoginStateFailureImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$LoginStateFailureImplCopyWith<_$LoginStateFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
