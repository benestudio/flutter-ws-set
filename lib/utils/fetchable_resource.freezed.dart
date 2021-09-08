// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'fetchable_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FetchableResourceTearOff {
  const _$FetchableResourceTearOff();

  UnavailableResource<T, E> unavailable<T, E>() {
    return UnavailableResource<T, E>();
  }

  FetchingResource<T, E> fetching<T, E>({T? oldData = null}) {
    return FetchingResource<T, E>(
      oldData: oldData,
    );
  }

  AvailableResource<T, E> available<T, E>(T data) {
    return AvailableResource<T, E>(
      data,
    );
  }

  ErrorResource<T, E> error<T, E>([E? error]) {
    return ErrorResource<T, E>(
      error,
    );
  }
}

/// @nodoc
const $FetchableResource = _$FetchableResourceTearOff();

/// @nodoc
mixin _$FetchableResource<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(T? oldData) fetching,
    required TResult Function(T data) available,
    required TResult Function(E? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? oldData)? fetching,
    TResult Function(T data)? available,
    TResult Function(E? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchableResourceCopyWith<T, E, $Res> {
  factory $FetchableResourceCopyWith(FetchableResource<T, E> value,
          $Res Function(FetchableResource<T, E>) then) =
      _$FetchableResourceCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class _$FetchableResourceCopyWithImpl<T, E, $Res>
    implements $FetchableResourceCopyWith<T, E, $Res> {
  _$FetchableResourceCopyWithImpl(this._value, this._then);

  final FetchableResource<T, E> _value;
  // ignore: unused_field
  final $Res Function(FetchableResource<T, E>) _then;
}

/// @nodoc
abstract class $UnavailableResourceCopyWith<T, E, $Res> {
  factory $UnavailableResourceCopyWith(UnavailableResource<T, E> value,
          $Res Function(UnavailableResource<T, E>) then) =
      _$UnavailableResourceCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class _$UnavailableResourceCopyWithImpl<T, E, $Res>
    extends _$FetchableResourceCopyWithImpl<T, E, $Res>
    implements $UnavailableResourceCopyWith<T, E, $Res> {
  _$UnavailableResourceCopyWithImpl(UnavailableResource<T, E> _value,
      $Res Function(UnavailableResource<T, E>) _then)
      : super(_value, (v) => _then(v as UnavailableResource<T, E>));

  @override
  UnavailableResource<T, E> get _value =>
      super._value as UnavailableResource<T, E>;
}

/// @nodoc

class _$UnavailableResource<T, E> extends UnavailableResource<T, E> {
  const _$UnavailableResource() : super._();

  @override
  String toString() {
    return 'FetchableResource<$T, $E>.unavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnavailableResource<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(T? oldData) fetching,
    required TResult Function(T data) available,
    required TResult Function(E? error) error,
  }) {
    return unavailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? oldData)? fetching,
    TResult Function(T data)? available,
    TResult Function(E? error)? error,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class UnavailableResource<T, E> extends FetchableResource<T, E> {
  const factory UnavailableResource() = _$UnavailableResource<T, E>;
  const UnavailableResource._() : super._();
}

/// @nodoc
abstract class $FetchingResourceCopyWith<T, E, $Res> {
  factory $FetchingResourceCopyWith(FetchingResource<T, E> value,
          $Res Function(FetchingResource<T, E>) then) =
      _$FetchingResourceCopyWithImpl<T, E, $Res>;
  $Res call({T? oldData});
}

/// @nodoc
class _$FetchingResourceCopyWithImpl<T, E, $Res>
    extends _$FetchableResourceCopyWithImpl<T, E, $Res>
    implements $FetchingResourceCopyWith<T, E, $Res> {
  _$FetchingResourceCopyWithImpl(FetchingResource<T, E> _value,
      $Res Function(FetchingResource<T, E>) _then)
      : super(_value, (v) => _then(v as FetchingResource<T, E>));

  @override
  FetchingResource<T, E> get _value => super._value as FetchingResource<T, E>;

  @override
  $Res call({
    Object? oldData = freezed,
  }) {
    return _then(FetchingResource<T, E>(
      oldData: oldData == freezed
          ? _value.oldData
          : oldData // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$FetchingResource<T, E> extends FetchingResource<T, E> {
  const _$FetchingResource({this.oldData = null}) : super._();

  @JsonKey(defaultValue: null)
  @override
  final T? oldData;

  @override
  String toString() {
    return 'FetchableResource<$T, $E>.fetching(oldData: $oldData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchingResource<T, E> &&
            (identical(other.oldData, oldData) ||
                const DeepCollectionEquality().equals(other.oldData, oldData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(oldData);

  @JsonKey(ignore: true)
  @override
  $FetchingResourceCopyWith<T, E, FetchingResource<T, E>> get copyWith =>
      _$FetchingResourceCopyWithImpl<T, E, FetchingResource<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(T? oldData) fetching,
    required TResult Function(T data) available,
    required TResult Function(E? error) error,
  }) {
    return fetching(oldData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? oldData)? fetching,
    TResult Function(T data)? available,
    TResult Function(E? error)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(oldData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class FetchingResource<T, E> extends FetchableResource<T, E> {
  const factory FetchingResource({T? oldData}) = _$FetchingResource<T, E>;
  const FetchingResource._() : super._();

  T? get oldData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchingResourceCopyWith<T, E, FetchingResource<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableResourceCopyWith<T, E, $Res> {
  factory $AvailableResourceCopyWith(AvailableResource<T, E> value,
          $Res Function(AvailableResource<T, E>) then) =
      _$AvailableResourceCopyWithImpl<T, E, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$AvailableResourceCopyWithImpl<T, E, $Res>
    extends _$FetchableResourceCopyWithImpl<T, E, $Res>
    implements $AvailableResourceCopyWith<T, E, $Res> {
  _$AvailableResourceCopyWithImpl(AvailableResource<T, E> _value,
      $Res Function(AvailableResource<T, E>) _then)
      : super(_value, (v) => _then(v as AvailableResource<T, E>));

  @override
  AvailableResource<T, E> get _value => super._value as AvailableResource<T, E>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(AvailableResource<T, E>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AvailableResource<T, E> extends AvailableResource<T, E> {
  const _$AvailableResource(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'FetchableResource<$T, $E>.available(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvailableResource<T, E> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $AvailableResourceCopyWith<T, E, AvailableResource<T, E>> get copyWith =>
      _$AvailableResourceCopyWithImpl<T, E, AvailableResource<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(T? oldData) fetching,
    required TResult Function(T data) available,
    required TResult Function(E? error) error,
  }) {
    return available(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? oldData)? fetching,
    TResult Function(T data)? available,
    TResult Function(E? error)? error,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class AvailableResource<T, E> extends FetchableResource<T, E> {
  const factory AvailableResource(T data) = _$AvailableResource<T, E>;
  const AvailableResource._() : super._();

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableResourceCopyWith<T, E, AvailableResource<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResourceCopyWith<T, E, $Res> {
  factory $ErrorResourceCopyWith(
          ErrorResource<T, E> value, $Res Function(ErrorResource<T, E>) then) =
      _$ErrorResourceCopyWithImpl<T, E, $Res>;
  $Res call({E? error});
}

/// @nodoc
class _$ErrorResourceCopyWithImpl<T, E, $Res>
    extends _$FetchableResourceCopyWithImpl<T, E, $Res>
    implements $ErrorResourceCopyWith<T, E, $Res> {
  _$ErrorResourceCopyWithImpl(
      ErrorResource<T, E> _value, $Res Function(ErrorResource<T, E>) _then)
      : super(_value, (v) => _then(v as ErrorResource<T, E>));

  @override
  ErrorResource<T, E> get _value => super._value as ErrorResource<T, E>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ErrorResource<T, E>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E?,
    ));
  }
}

/// @nodoc

class _$ErrorResource<T, E> extends ErrorResource<T, E> {
  const _$ErrorResource([this.error]) : super._();

  @override
  final E? error;

  @override
  String toString() {
    return 'FetchableResource<$T, $E>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorResource<T, E> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ErrorResourceCopyWith<T, E, ErrorResource<T, E>> get copyWith =>
      _$ErrorResourceCopyWithImpl<T, E, ErrorResource<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(T? oldData) fetching,
    required TResult Function(T data) available,
    required TResult Function(E? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(T? oldData)? fetching,
    TResult Function(T data)? available,
    TResult Function(E? error)? error,
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
    required TResult Function(UnavailableResource<T, E> value) unavailable,
    required TResult Function(FetchingResource<T, E> value) fetching,
    required TResult Function(AvailableResource<T, E> value) available,
    required TResult Function(ErrorResource<T, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnavailableResource<T, E> value)? unavailable,
    TResult Function(FetchingResource<T, E> value)? fetching,
    TResult Function(AvailableResource<T, E> value)? available,
    TResult Function(ErrorResource<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorResource<T, E> extends FetchableResource<T, E> {
  const factory ErrorResource([E? error]) = _$ErrorResource<T, E>;
  const ErrorResource._() : super._();

  E? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResourceCopyWith<T, E, ErrorResource<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
