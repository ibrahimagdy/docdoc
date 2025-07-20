// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            ForgotPasswordResponseModel forgotPasswordResponseModel)
        success,
    required TResult Function(ApiErrorModel error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult? Function(ApiErrorModel error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ForgotPasswordLoading<T> value) loading,
    required TResult Function(ForgotPasswordSuccess<T> value) success,
    required TResult Function(ForgotPasswordError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ForgotPasswordLoading<T> value)? loading,
    TResult? Function(ForgotPasswordSuccess<T> value)? success,
    TResult? Function(ForgotPasswordError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ForgotPasswordLoading<T> value)? loading,
    TResult Function(ForgotPasswordSuccess<T> value)? success,
    TResult Function(ForgotPasswordError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<T, $Res> {
  factory $ForgotPasswordStateCopyWith(ForgotPasswordState<T> value,
          $Res Function(ForgotPasswordState<T>) then) =
      _$ForgotPasswordStateCopyWithImpl<T, $Res, ForgotPasswordState<T>>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<T, $Res,
        $Val extends ForgotPasswordState<T>>
    implements $ForgotPasswordStateCopyWith<T, $Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ForgotPasswordStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ForgotPasswordState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            ForgotPasswordResponseModel forgotPasswordResponseModel)
        success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult Function(ApiErrorModel error)? error,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ForgotPasswordLoading<T> value) loading,
    required TResult Function(ForgotPasswordSuccess<T> value) success,
    required TResult Function(ForgotPasswordError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ForgotPasswordLoading<T> value)? loading,
    TResult? Function(ForgotPasswordSuccess<T> value)? success,
    TResult? Function(ForgotPasswordError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ForgotPasswordLoading<T> value)? loading,
    TResult Function(ForgotPasswordSuccess<T> value)? success,
    TResult Function(ForgotPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ForgotPasswordState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ForgotPasswordLoadingImplCopyWith<T, $Res> {
  factory _$$ForgotPasswordLoadingImplCopyWith(
          _$ForgotPasswordLoadingImpl<T> value,
          $Res Function(_$ForgotPasswordLoadingImpl<T>) then) =
      __$$ForgotPasswordLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ForgotPasswordLoadingImplCopyWithImpl<T, $Res>
    extends _$ForgotPasswordStateCopyWithImpl<T, $Res,
        _$ForgotPasswordLoadingImpl<T>>
    implements _$$ForgotPasswordLoadingImplCopyWith<T, $Res> {
  __$$ForgotPasswordLoadingImplCopyWithImpl(
      _$ForgotPasswordLoadingImpl<T> _value,
      $Res Function(_$ForgotPasswordLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForgotPasswordLoadingImpl<T> implements ForgotPasswordLoading<T> {
  const _$ForgotPasswordLoadingImpl();

  @override
  String toString() {
    return 'ForgotPasswordState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            ForgotPasswordResponseModel forgotPasswordResponseModel)
        success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult Function(ApiErrorModel error)? error,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ForgotPasswordLoading<T> value) loading,
    required TResult Function(ForgotPasswordSuccess<T> value) success,
    required TResult Function(ForgotPasswordError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ForgotPasswordLoading<T> value)? loading,
    TResult? Function(ForgotPasswordSuccess<T> value)? success,
    TResult? Function(ForgotPasswordError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ForgotPasswordLoading<T> value)? loading,
    TResult Function(ForgotPasswordSuccess<T> value)? success,
    TResult Function(ForgotPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordLoading<T> implements ForgotPasswordState<T> {
  const factory ForgotPasswordLoading() = _$ForgotPasswordLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ForgotPasswordSuccessImplCopyWith<T, $Res> {
  factory _$$ForgotPasswordSuccessImplCopyWith(
          _$ForgotPasswordSuccessImpl<T> value,
          $Res Function(_$ForgotPasswordSuccessImpl<T>) then) =
      __$$ForgotPasswordSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ForgotPasswordResponseModel forgotPasswordResponseModel});
}

/// @nodoc
class __$$ForgotPasswordSuccessImplCopyWithImpl<T, $Res>
    extends _$ForgotPasswordStateCopyWithImpl<T, $Res,
        _$ForgotPasswordSuccessImpl<T>>
    implements _$$ForgotPasswordSuccessImplCopyWith<T, $Res> {
  __$$ForgotPasswordSuccessImplCopyWithImpl(
      _$ForgotPasswordSuccessImpl<T> _value,
      $Res Function(_$ForgotPasswordSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgotPasswordResponseModel = null,
  }) {
    return _then(_$ForgotPasswordSuccessImpl<T>(
      null == forgotPasswordResponseModel
          ? _value.forgotPasswordResponseModel
          : forgotPasswordResponseModel // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponseModel,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordSuccessImpl<T> implements ForgotPasswordSuccess<T> {
  const _$ForgotPasswordSuccessImpl(this.forgotPasswordResponseModel);

  @override
  final ForgotPasswordResponseModel forgotPasswordResponseModel;

  @override
  String toString() {
    return 'ForgotPasswordState<$T>.success(forgotPasswordResponseModel: $forgotPasswordResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordSuccessImpl<T> &&
            (identical(other.forgotPasswordResponseModel,
                    forgotPasswordResponseModel) ||
                other.forgotPasswordResponseModel ==
                    forgotPasswordResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forgotPasswordResponseModel);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordSuccessImplCopyWith<T, _$ForgotPasswordSuccessImpl<T>>
      get copyWith => __$$ForgotPasswordSuccessImplCopyWithImpl<T,
          _$ForgotPasswordSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            ForgotPasswordResponseModel forgotPasswordResponseModel)
        success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return success(forgotPasswordResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return success?.call(forgotPasswordResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(forgotPasswordResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ForgotPasswordLoading<T> value) loading,
    required TResult Function(ForgotPasswordSuccess<T> value) success,
    required TResult Function(ForgotPasswordError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ForgotPasswordLoading<T> value)? loading,
    TResult? Function(ForgotPasswordSuccess<T> value)? success,
    TResult? Function(ForgotPasswordError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ForgotPasswordLoading<T> value)? loading,
    TResult Function(ForgotPasswordSuccess<T> value)? success,
    TResult Function(ForgotPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordSuccess<T> implements ForgotPasswordState<T> {
  const factory ForgotPasswordSuccess(
          final ForgotPasswordResponseModel forgotPasswordResponseModel) =
      _$ForgotPasswordSuccessImpl<T>;

  ForgotPasswordResponseModel get forgotPasswordResponseModel;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordSuccessImplCopyWith<T, _$ForgotPasswordSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordErrorImplCopyWith<T, $Res> {
  factory _$$ForgotPasswordErrorImplCopyWith(_$ForgotPasswordErrorImpl<T> value,
          $Res Function(_$ForgotPasswordErrorImpl<T>) then) =
      __$$ForgotPasswordErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$ForgotPasswordErrorImplCopyWithImpl<T, $Res>
    extends _$ForgotPasswordStateCopyWithImpl<T, $Res,
        _$ForgotPasswordErrorImpl<T>>
    implements _$$ForgotPasswordErrorImplCopyWith<T, $Res> {
  __$$ForgotPasswordErrorImplCopyWithImpl(_$ForgotPasswordErrorImpl<T> _value,
      $Res Function(_$ForgotPasswordErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ForgotPasswordErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordErrorImpl<T> implements ForgotPasswordError<T> {
  const _$ForgotPasswordErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'ForgotPasswordState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordErrorImplCopyWith<T, _$ForgotPasswordErrorImpl<T>>
      get copyWith => __$$ForgotPasswordErrorImplCopyWithImpl<T,
          _$ForgotPasswordErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            ForgotPasswordResponseModel forgotPasswordResponseModel)
        success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ForgotPasswordResponseModel forgotPasswordResponseModel)?
        success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ForgotPasswordLoading<T> value) loading,
    required TResult Function(ForgotPasswordSuccess<T> value) success,
    required TResult Function(ForgotPasswordError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ForgotPasswordLoading<T> value)? loading,
    TResult? Function(ForgotPasswordSuccess<T> value)? success,
    TResult? Function(ForgotPasswordError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ForgotPasswordLoading<T> value)? loading,
    TResult Function(ForgotPasswordSuccess<T> value)? success,
    TResult Function(ForgotPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordError<T> implements ForgotPasswordState<T> {
  const factory ForgotPasswordError({required final ApiErrorModel error}) =
      _$ForgotPasswordErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordErrorImplCopyWith<T, _$ForgotPasswordErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
