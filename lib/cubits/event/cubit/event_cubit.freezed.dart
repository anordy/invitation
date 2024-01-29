// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventState {
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
    required TResult Function(_EventStateLoading value) loading,
    required TResult Function(_EventStateSuccess value) success,
    required TResult Function(_EventStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_EventStateLoading value)? loading,
    TResult? Function(_EventStateSuccess value)? success,
    TResult? Function(_EventStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_EventStateLoading value)? loading,
    TResult Function(_EventStateSuccess value)? success,
    TResult Function(_EventStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
          EventState value, $Res Function(EventState) then) =
      _$EventStateCopyWithImpl<$Res, EventState>;
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res, $Val extends EventState>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'EventState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
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
    required TResult Function(_EventStateLoading value) loading,
    required TResult Function(_EventStateSuccess value) success,
    required TResult Function(_EventStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_EventStateLoading value)? loading,
    TResult? Function(_EventStateSuccess value)? success,
    TResult? Function(_EventStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_EventStateLoading value)? loading,
    TResult Function(_EventStateSuccess value)? success,
    TResult Function(_EventStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EventState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_EventStateLoadingCopyWith<$Res> {
  factory _$$_EventStateLoadingCopyWith(_$_EventStateLoading value,
          $Res Function(_$_EventStateLoading) then) =
      __$$_EventStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EventStateLoadingCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$_EventStateLoading>
    implements _$$_EventStateLoadingCopyWith<$Res> {
  __$$_EventStateLoadingCopyWithImpl(
      _$_EventStateLoading _value, $Res Function(_$_EventStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EventStateLoading implements _EventStateLoading {
  const _$_EventStateLoading();

  @override
  String toString() {
    return 'EventState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EventStateLoading);
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
    required TResult Function(_EventStateLoading value) loading,
    required TResult Function(_EventStateSuccess value) success,
    required TResult Function(_EventStateFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_EventStateLoading value)? loading,
    TResult? Function(_EventStateSuccess value)? success,
    TResult? Function(_EventStateFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_EventStateLoading value)? loading,
    TResult Function(_EventStateSuccess value)? success,
    TResult Function(_EventStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _EventStateLoading implements EventState {
  const factory _EventStateLoading() = _$_EventStateLoading;
}

/// @nodoc
abstract class _$$_EventStateSuccessCopyWith<$Res> {
  factory _$$_EventStateSuccessCopyWith(_$_EventStateSuccess value,
          $Res Function(_$_EventStateSuccess) then) =
      __$$_EventStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic user});
}

/// @nodoc
class __$$_EventStateSuccessCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$_EventStateSuccess>
    implements _$$_EventStateSuccessCopyWith<$Res> {
  __$$_EventStateSuccessCopyWithImpl(
      _$_EventStateSuccess _value, $Res Function(_$_EventStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_EventStateSuccess(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_EventStateSuccess implements _EventStateSuccess {
  const _$_EventStateSuccess({required this.user});

  @override
  final dynamic user;

  @override
  String toString() {
    return 'EventState.success(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventStateSuccess &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventStateSuccessCopyWith<_$_EventStateSuccess> get copyWith =>
      __$$_EventStateSuccessCopyWithImpl<_$_EventStateSuccess>(
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
    required TResult Function(_EventStateLoading value) loading,
    required TResult Function(_EventStateSuccess value) success,
    required TResult Function(_EventStateFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_EventStateLoading value)? loading,
    TResult? Function(_EventStateSuccess value)? success,
    TResult? Function(_EventStateFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_EventStateLoading value)? loading,
    TResult Function(_EventStateSuccess value)? success,
    TResult Function(_EventStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _EventStateSuccess implements EventState {
  const factory _EventStateSuccess({required final dynamic user}) =
      _$_EventStateSuccess;

  dynamic get user;
  @JsonKey(ignore: true)
  _$$_EventStateSuccessCopyWith<_$_EventStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EventStateFailureCopyWith<$Res> {
  factory _$$_EventStateFailureCopyWith(_$_EventStateFailure value,
          $Res Function(_$_EventStateFailure) then) =
      __$$_EventStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$_EventStateFailureCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$_EventStateFailure>
    implements _$$_EventStateFailureCopyWith<$Res> {
  __$$_EventStateFailureCopyWithImpl(
      _$_EventStateFailure _value, $Res Function(_$_EventStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$_EventStateFailure(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EventStateFailure implements _EventStateFailure {
  const _$_EventStateFailure({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'EventState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventStateFailure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventStateFailureCopyWith<_$_EventStateFailure> get copyWith =>
      __$$_EventStateFailureCopyWithImpl<_$_EventStateFailure>(
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
    required TResult Function(_EventStateLoading value) loading,
    required TResult Function(_EventStateSuccess value) success,
    required TResult Function(_EventStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_EventStateLoading value)? loading,
    TResult? Function(_EventStateSuccess value)? success,
    TResult? Function(_EventStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_EventStateLoading value)? loading,
    TResult Function(_EventStateSuccess value)? success,
    TResult Function(_EventStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _EventStateFailure implements EventState {
  const factory _EventStateFailure({required final String errorMessage}) =
      _$_EventStateFailure;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$_EventStateFailureCopyWith<_$_EventStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
