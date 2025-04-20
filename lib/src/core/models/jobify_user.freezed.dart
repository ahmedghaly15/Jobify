// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobify_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobifyUser {

@SessionJsonConverter() Session get session;@UserJsonConverter() User get user; String? get createdAt;
/// Create a copy of JobifyUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobifyUserCopyWith<JobifyUser> get copyWith => _$JobifyUserCopyWithImpl<JobifyUser>(this as JobifyUser, _$identity);

  /// Serializes this JobifyUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobifyUser&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,user,createdAt);

@override
String toString() {
  return 'JobifyUser(session: $session, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $JobifyUserCopyWith<$Res>  {
  factory $JobifyUserCopyWith(JobifyUser value, $Res Function(JobifyUser) _then) = _$JobifyUserCopyWithImpl;
@useResult
$Res call({
@SessionJsonConverter() Session session,@UserJsonConverter() User user, String? createdAt
});




}
/// @nodoc
class _$JobifyUserCopyWithImpl<$Res>
    implements $JobifyUserCopyWith<$Res> {
  _$JobifyUserCopyWithImpl(this._self, this._then);

  final JobifyUser _self;
  final $Res Function(JobifyUser) _then;

/// Create a copy of JobifyUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? user = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _JobifyUser implements JobifyUser {
  const _JobifyUser({@SessionJsonConverter() required this.session, @UserJsonConverter() required this.user, this.createdAt});
  factory _JobifyUser.fromJson(Map<String, dynamic> json) => _$JobifyUserFromJson(json);

@override@SessionJsonConverter() final  Session session;
@override@UserJsonConverter() final  User user;
@override final  String? createdAt;

/// Create a copy of JobifyUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobifyUserCopyWith<_JobifyUser> get copyWith => __$JobifyUserCopyWithImpl<_JobifyUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobifyUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobifyUser&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,user,createdAt);

@override
String toString() {
  return 'JobifyUser(session: $session, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JobifyUserCopyWith<$Res> implements $JobifyUserCopyWith<$Res> {
  factory _$JobifyUserCopyWith(_JobifyUser value, $Res Function(_JobifyUser) _then) = __$JobifyUserCopyWithImpl;
@override @useResult
$Res call({
@SessionJsonConverter() Session session,@UserJsonConverter() User user, String? createdAt
});




}
/// @nodoc
class __$JobifyUserCopyWithImpl<$Res>
    implements _$JobifyUserCopyWith<$Res> {
  __$JobifyUserCopyWithImpl(this._self, this._then);

  final _JobifyUser _self;
  final $Res Function(_JobifyUser) _then;

/// Create a copy of JobifyUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? user = null,Object? createdAt = freezed,}) {
  return _then(_JobifyUser(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
