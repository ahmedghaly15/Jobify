// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobify_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JobifyUser _$JobifyUserFromJson(Map<String, dynamic> json) {
  return _JobifyUser.fromJson(json);
}

/// @nodoc
mixin _$JobifyUser {
  @SessionJsonConverter()
  Session? get session => throw _privateConstructorUsedError;
  @UserJsonConverter()
  User? get user => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this JobifyUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobifyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobifyUserCopyWith<JobifyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobifyUserCopyWith<$Res> {
  factory $JobifyUserCopyWith(
    JobifyUser value,
    $Res Function(JobifyUser) then,
  ) = _$JobifyUserCopyWithImpl<$Res, JobifyUser>;
  @useResult
  $Res call({
    @SessionJsonConverter() Session? session,
    @UserJsonConverter() User? user,
    String? name,
    String? createdAt,
  });
}

/// @nodoc
class _$JobifyUserCopyWithImpl<$Res, $Val extends JobifyUser>
    implements $JobifyUserCopyWith<$Res> {
  _$JobifyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobifyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? user = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            session:
                freezed == session
                    ? _value.session
                    : session // ignore: cast_nullable_to_non_nullable
                        as Session?,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as User?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobifyUserImplCopyWith<$Res>
    implements $JobifyUserCopyWith<$Res> {
  factory _$$JobifyUserImplCopyWith(
    _$JobifyUserImpl value,
    $Res Function(_$JobifyUserImpl) then,
  ) = __$$JobifyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @SessionJsonConverter() Session? session,
    @UserJsonConverter() User? user,
    String? name,
    String? createdAt,
  });
}

/// @nodoc
class __$$JobifyUserImplCopyWithImpl<$Res>
    extends _$JobifyUserCopyWithImpl<$Res, _$JobifyUserImpl>
    implements _$$JobifyUserImplCopyWith<$Res> {
  __$$JobifyUserImplCopyWithImpl(
    _$JobifyUserImpl _value,
    $Res Function(_$JobifyUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobifyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? user = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$JobifyUserImpl(
        session:
            freezed == session
                ? _value.session
                : session // ignore: cast_nullable_to_non_nullable
                    as Session?,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as User?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$JobifyUserImpl implements _JobifyUser {
  const _$JobifyUserImpl({
    @SessionJsonConverter() this.session,
    @UserJsonConverter() this.user,
    this.name,
    this.createdAt,
  });

  factory _$JobifyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobifyUserImplFromJson(json);

  @override
  @SessionJsonConverter()
  final Session? session;
  @override
  @UserJsonConverter()
  final User? user;
  @override
  final String? name;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'JobifyUser(session: $session, user: $user, name: $name, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobifyUserImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, session, user, name, createdAt);

  /// Create a copy of JobifyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobifyUserImplCopyWith<_$JobifyUserImpl> get copyWith =>
      __$$JobifyUserImplCopyWithImpl<_$JobifyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobifyUserImplToJson(this);
  }
}

abstract class _JobifyUser implements JobifyUser {
  const factory _JobifyUser({
    @SessionJsonConverter() final Session? session,
    @UserJsonConverter() final User? user,
    final String? name,
    final String? createdAt,
  }) = _$JobifyUserImpl;

  factory _JobifyUser.fromJson(Map<String, dynamic> json) =
      _$JobifyUserImpl.fromJson;

  @override
  @SessionJsonConverter()
  Session? get session;
  @override
  @UserJsonConverter()
  User? get user;
  @override
  String? get name;
  @override
  String? get createdAt;

  /// Create a copy of JobifyUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobifyUserImplCopyWith<_$JobifyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
