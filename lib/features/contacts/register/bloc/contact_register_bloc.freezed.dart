// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contact_register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactRegisterEvent {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String email) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String email)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContactRegisterEventSave value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterEventSave value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterEventSave value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactRegisterEventCopyWith<ContactRegisterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactRegisterEventCopyWith<$Res> {
  factory $ContactRegisterEventCopyWith(ContactRegisterEvent value,
          $Res Function(ContactRegisterEvent) then) =
      _$ContactRegisterEventCopyWithImpl<$Res>;
  $Res call({String name, String email});
}

/// @nodoc
class _$ContactRegisterEventCopyWithImpl<$Res>
    implements $ContactRegisterEventCopyWith<$Res> {
  _$ContactRegisterEventCopyWithImpl(this._value, this._then);

  final ContactRegisterEvent _value;
  // ignore: unused_field
  final $Res Function(ContactRegisterEvent) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ContactRegisterEventSaveCopyWith<$Res>
    implements $ContactRegisterEventCopyWith<$Res> {
  factory _$$_ContactRegisterEventSaveCopyWith(
          _$_ContactRegisterEventSave value,
          $Res Function(_$_ContactRegisterEventSave) then) =
      __$$_ContactRegisterEventSaveCopyWithImpl<$Res>;
  @override
  $Res call({String name, String email});
}

/// @nodoc
class __$$_ContactRegisterEventSaveCopyWithImpl<$Res>
    extends _$ContactRegisterEventCopyWithImpl<$Res>
    implements _$$_ContactRegisterEventSaveCopyWith<$Res> {
  __$$_ContactRegisterEventSaveCopyWithImpl(_$_ContactRegisterEventSave _value,
      $Res Function(_$_ContactRegisterEventSave) _then)
      : super(_value, (v) => _then(v as _$_ContactRegisterEventSave));

  @override
  _$_ContactRegisterEventSave get _value =>
      super._value as _$_ContactRegisterEventSave;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_ContactRegisterEventSave(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ContactRegisterEventSave implements _ContactRegisterEventSave {
  const _$_ContactRegisterEventSave({required this.name, required this.email});

  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'ContactRegisterEvent.save(name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactRegisterEventSave &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_ContactRegisterEventSaveCopyWith<_$_ContactRegisterEventSave>
      get copyWith => __$$_ContactRegisterEventSaveCopyWithImpl<
          _$_ContactRegisterEventSave>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String email) save,
  }) {
    return save(name, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String email)? save,
  }) {
    return save?.call(name, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(name, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContactRegisterEventSave value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterEventSave value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterEventSave value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _ContactRegisterEventSave implements ContactRegisterEvent {
  const factory _ContactRegisterEventSave(
      {required final String name,
      required final String email}) = _$_ContactRegisterEventSave;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContactRegisterEventSaveCopyWith<_$_ContactRegisterEventSave>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactRegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContactRegisterStateInitial value) initial,
    required TResult Function(_ContactRegisterStateLoading value) loading,
    required TResult Function(_ContactRegisterStateSuccess value) success,
    required TResult Function(_ContactRegisterStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactRegisterStateCopyWith<$Res> {
  factory $ContactRegisterStateCopyWith(ContactRegisterState value,
          $Res Function(ContactRegisterState) then) =
      _$ContactRegisterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ContactRegisterStateCopyWithImpl<$Res>
    implements $ContactRegisterStateCopyWith<$Res> {
  _$ContactRegisterStateCopyWithImpl(this._value, this._then);

  final ContactRegisterState _value;
  // ignore: unused_field
  final $Res Function(ContactRegisterState) _then;
}

/// @nodoc
abstract class _$$_ContactRegisterStateInitialCopyWith<$Res> {
  factory _$$_ContactRegisterStateInitialCopyWith(
          _$_ContactRegisterStateInitial value,
          $Res Function(_$_ContactRegisterStateInitial) then) =
      __$$_ContactRegisterStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ContactRegisterStateInitialCopyWithImpl<$Res>
    extends _$ContactRegisterStateCopyWithImpl<$Res>
    implements _$$_ContactRegisterStateInitialCopyWith<$Res> {
  __$$_ContactRegisterStateInitialCopyWithImpl(
      _$_ContactRegisterStateInitial _value,
      $Res Function(_$_ContactRegisterStateInitial) _then)
      : super(_value, (v) => _then(v as _$_ContactRegisterStateInitial));

  @override
  _$_ContactRegisterStateInitial get _value =>
      super._value as _$_ContactRegisterStateInitial;
}

/// @nodoc

class _$_ContactRegisterStateInitial implements _ContactRegisterStateInitial {
  const _$_ContactRegisterStateInitial();

  @override
  String toString() {
    return 'ContactRegisterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactRegisterStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
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
    required TResult Function(_ContactRegisterStateInitial value) initial,
    required TResult Function(_ContactRegisterStateLoading value) loading,
    required TResult Function(_ContactRegisterStateSuccess value) success,
    required TResult Function(_ContactRegisterStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ContactRegisterStateInitial implements ContactRegisterState {
  const factory _ContactRegisterStateInitial() = _$_ContactRegisterStateInitial;
}

/// @nodoc
abstract class _$$_ContactRegisterStateLoadingCopyWith<$Res> {
  factory _$$_ContactRegisterStateLoadingCopyWith(
          _$_ContactRegisterStateLoading value,
          $Res Function(_$_ContactRegisterStateLoading) then) =
      __$$_ContactRegisterStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ContactRegisterStateLoadingCopyWithImpl<$Res>
    extends _$ContactRegisterStateCopyWithImpl<$Res>
    implements _$$_ContactRegisterStateLoadingCopyWith<$Res> {
  __$$_ContactRegisterStateLoadingCopyWithImpl(
      _$_ContactRegisterStateLoading _value,
      $Res Function(_$_ContactRegisterStateLoading) _then)
      : super(_value, (v) => _then(v as _$_ContactRegisterStateLoading));

  @override
  _$_ContactRegisterStateLoading get _value =>
      super._value as _$_ContactRegisterStateLoading;
}

/// @nodoc

class _$_ContactRegisterStateLoading implements _ContactRegisterStateLoading {
  const _$_ContactRegisterStateLoading();

  @override
  String toString() {
    return 'ContactRegisterState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactRegisterStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
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
    required TResult Function(_ContactRegisterStateInitial value) initial,
    required TResult Function(_ContactRegisterStateLoading value) loading,
    required TResult Function(_ContactRegisterStateSuccess value) success,
    required TResult Function(_ContactRegisterStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ContactRegisterStateLoading implements ContactRegisterState {
  const factory _ContactRegisterStateLoading() = _$_ContactRegisterStateLoading;
}

/// @nodoc
abstract class _$$_ContactRegisterStateSuccessCopyWith<$Res> {
  factory _$$_ContactRegisterStateSuccessCopyWith(
          _$_ContactRegisterStateSuccess value,
          $Res Function(_$_ContactRegisterStateSuccess) then) =
      __$$_ContactRegisterStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ContactRegisterStateSuccessCopyWithImpl<$Res>
    extends _$ContactRegisterStateCopyWithImpl<$Res>
    implements _$$_ContactRegisterStateSuccessCopyWith<$Res> {
  __$$_ContactRegisterStateSuccessCopyWithImpl(
      _$_ContactRegisterStateSuccess _value,
      $Res Function(_$_ContactRegisterStateSuccess) _then)
      : super(_value, (v) => _then(v as _$_ContactRegisterStateSuccess));

  @override
  _$_ContactRegisterStateSuccess get _value =>
      super._value as _$_ContactRegisterStateSuccess;
}

/// @nodoc

class _$_ContactRegisterStateSuccess implements _ContactRegisterStateSuccess {
  const _$_ContactRegisterStateSuccess();

  @override
  String toString() {
    return 'ContactRegisterState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactRegisterStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContactRegisterStateInitial value) initial,
    required TResult Function(_ContactRegisterStateLoading value) loading,
    required TResult Function(_ContactRegisterStateSuccess value) success,
    required TResult Function(_ContactRegisterStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ContactRegisterStateSuccess implements ContactRegisterState {
  const factory _ContactRegisterStateSuccess() = _$_ContactRegisterStateSuccess;
}

/// @nodoc
abstract class _$$_ContactRegisterStateErrorCopyWith<$Res> {
  factory _$$_ContactRegisterStateErrorCopyWith(
          _$_ContactRegisterStateError value,
          $Res Function(_$_ContactRegisterStateError) then) =
      __$$_ContactRegisterStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_ContactRegisterStateErrorCopyWithImpl<$Res>
    extends _$ContactRegisterStateCopyWithImpl<$Res>
    implements _$$_ContactRegisterStateErrorCopyWith<$Res> {
  __$$_ContactRegisterStateErrorCopyWithImpl(
      _$_ContactRegisterStateError _value,
      $Res Function(_$_ContactRegisterStateError) _then)
      : super(_value, (v) => _then(v as _$_ContactRegisterStateError));

  @override
  _$_ContactRegisterStateError get _value =>
      super._value as _$_ContactRegisterStateError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_ContactRegisterStateError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ContactRegisterStateError implements _ContactRegisterStateError {
  const _$_ContactRegisterStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ContactRegisterState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactRegisterStateError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ContactRegisterStateErrorCopyWith<_$_ContactRegisterStateError>
      get copyWith => __$$_ContactRegisterStateErrorCopyWithImpl<
          _$_ContactRegisterStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContactRegisterStateInitial value) initial,
    required TResult Function(_ContactRegisterStateLoading value) loading,
    required TResult Function(_ContactRegisterStateSuccess value) success,
    required TResult Function(_ContactRegisterStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContactRegisterStateInitial value)? initial,
    TResult Function(_ContactRegisterStateLoading value)? loading,
    TResult Function(_ContactRegisterStateSuccess value)? success,
    TResult Function(_ContactRegisterStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ContactRegisterStateError implements ContactRegisterState {
  const factory _ContactRegisterStateError({required final String message}) =
      _$_ContactRegisterStateError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ContactRegisterStateErrorCopyWith<_$_ContactRegisterStateError>
      get copyWith => throw _privateConstructorUsedError;
}
