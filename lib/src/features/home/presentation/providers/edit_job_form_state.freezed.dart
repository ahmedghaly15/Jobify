// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_job_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EditJobFormState {
  String get position => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  JobStatus get status => throw _privateConstructorUsedError;
  JobMode get mode => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;

  /// Create a copy of EditJobFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditJobFormStateCopyWith<EditJobFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditJobFormStateCopyWith<$Res> {
  factory $EditJobFormStateCopyWith(
    EditJobFormState value,
    $Res Function(EditJobFormState) then,
  ) = _$EditJobFormStateCopyWithImpl<$Res, EditJobFormState>;
  @useResult
  $Res call({
    String position,
    String company,
    String location,
    JobStatus status,
    JobMode mode,
    bool isDirty,
  });
}

/// @nodoc
class _$EditJobFormStateCopyWithImpl<$Res, $Val extends EditJobFormState>
    implements $EditJobFormStateCopyWith<$Res> {
  _$EditJobFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditJobFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? company = null,
    Object? location = null,
    Object? status = null,
    Object? mode = null,
    Object? isDirty = null,
  }) {
    return _then(
      _value.copyWith(
            position:
                null == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as String,
            company:
                null == company
                    ? _value.company
                    : company // ignore: cast_nullable_to_non_nullable
                        as String,
            location:
                null == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as JobStatus,
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as JobMode,
            isDirty:
                null == isDirty
                    ? _value.isDirty
                    : isDirty // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EditJobFormStateImplCopyWith<$Res>
    implements $EditJobFormStateCopyWith<$Res> {
  factory _$$EditJobFormStateImplCopyWith(
    _$EditJobFormStateImpl value,
    $Res Function(_$EditJobFormStateImpl) then,
  ) = __$$EditJobFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String position,
    String company,
    String location,
    JobStatus status,
    JobMode mode,
    bool isDirty,
  });
}

/// @nodoc
class __$$EditJobFormStateImplCopyWithImpl<$Res>
    extends _$EditJobFormStateCopyWithImpl<$Res, _$EditJobFormStateImpl>
    implements _$$EditJobFormStateImplCopyWith<$Res> {
  __$$EditJobFormStateImplCopyWithImpl(
    _$EditJobFormStateImpl _value,
    $Res Function(_$EditJobFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EditJobFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? company = null,
    Object? location = null,
    Object? status = null,
    Object? mode = null,
    Object? isDirty = null,
  }) {
    return _then(
      _$EditJobFormStateImpl(
        position:
            null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as String,
        company:
            null == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as JobStatus,
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as JobMode,
        isDirty:
            null == isDirty
                ? _value.isDirty
                : isDirty // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$EditJobFormStateImpl implements _EditJobFormState {
  const _$EditJobFormStateImpl({
    required this.position,
    required this.company,
    required this.location,
    required this.status,
    required this.mode,
    this.isDirty = false,
  });

  @override
  final String position;
  @override
  final String company;
  @override
  final String location;
  @override
  final JobStatus status;
  @override
  final JobMode mode;
  @override
  @JsonKey()
  final bool isDirty;

  @override
  String toString() {
    return 'EditJobFormState(position: $position, company: $company, location: $location, status: $status, mode: $mode, isDirty: $isDirty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditJobFormStateImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    position,
    company,
    location,
    status,
    mode,
    isDirty,
  );

  /// Create a copy of EditJobFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditJobFormStateImplCopyWith<_$EditJobFormStateImpl> get copyWith =>
      __$$EditJobFormStateImplCopyWithImpl<_$EditJobFormStateImpl>(
        this,
        _$identity,
      );
}

abstract class _EditJobFormState implements EditJobFormState {
  const factory _EditJobFormState({
    required final String position,
    required final String company,
    required final String location,
    required final JobStatus status,
    required final JobMode mode,
    final bool isDirty,
  }) = _$EditJobFormStateImpl;

  @override
  String get position;
  @override
  String get company;
  @override
  String get location;
  @override
  JobStatus get status;
  @override
  JobMode get mode;
  @override
  bool get isDirty;

  /// Create a copy of EditJobFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditJobFormStateImplCopyWith<_$EditJobFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
