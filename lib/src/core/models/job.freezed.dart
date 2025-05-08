// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Job _$JobFromJson(Map<String, dynamic> json) {
  return _Job.fromJson(json);
}

/// @nodoc
mixin _$Job {
  int get id => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  JobMode? get mode => throw _privateConstructorUsedError;
  JobStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call({
    int id,
    String? position,
    String? company,
    String? location,
    JobMode? mode,
    JobStatus? status,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = freezed,
    Object? company = freezed,
    Object? location = freezed,
    Object? mode = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            position:
                freezed == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as String?,
            company:
                freezed == company
                    ? _value.company
                    : company // ignore: cast_nullable_to_non_nullable
                        as String?,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String?,
            mode:
                freezed == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as JobMode?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as JobStatus?,
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
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? position,
    String? company,
    String? location,
    JobMode? mode,
    JobStatus? status,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
    : super(_value, _then);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = freezed,
    Object? company = freezed,
    Object? location = freezed,
    Object? mode = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$JobImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        position:
            freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as String?,
        company:
            freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                    as String?,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String?,
        mode:
            freezed == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as JobMode?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as JobStatus?,
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

@JsonSerializable()
class _$JobImpl implements _Job {
  const _$JobImpl({
    required this.id,
    this.position,
    this.company,
    this.location,
    this.mode,
    this.status,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$JobImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobImplFromJson(json);

  @override
  final int id;
  @override
  final String? position;
  @override
  final String? company;
  @override
  final String? location;
  @override
  final JobMode? mode;
  @override
  final JobStatus? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'Job(id: $id, position: $position, company: $company, location: $location, mode: $mode, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    position,
    company,
    location,
    mode,
    status,
    createdAt,
  );

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobImplToJson(this);
  }
}

abstract class _Job implements Job {
  const factory _Job({
    required final int id,
    final String? position,
    final String? company,
    final String? location,
    final JobMode? mode,
    final JobStatus? status,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$JobImpl;

  factory _Job.fromJson(Map<String, dynamic> json) = _$JobImpl.fromJson;

  @override
  int get id;
  @override
  String? get position;
  @override
  String? get company;
  @override
  String? get location;
  @override
  JobMode? get mode;
  @override
  JobStatus? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
