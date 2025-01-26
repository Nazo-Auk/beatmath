// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreRecord _$ScoreRecordFromJson(Map<String, dynamic> json) {
  return _ScoreRecord.fromJson(json);
}

/// @nodoc
mixin _$ScoreRecord {
  @HiveField(1)
  int get score => throw _privateConstructorUsedError;
  @HiveField(2)
  int get combo => throw _privateConstructorUsedError;
  @HiveField(3)
  double get accuracy => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get playDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreRecordCopyWith<ScoreRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreRecordCopyWith<$Res> {
  factory $ScoreRecordCopyWith(
          ScoreRecord value, $Res Function(ScoreRecord) then) =
      _$ScoreRecordCopyWithImpl<$Res, ScoreRecord>;
  @useResult
  $Res call(
      {@HiveField(1) int score,
      @HiveField(2) int combo,
      @HiveField(3) double accuracy,
      @HiveField(4) DateTime playDate});
}

/// @nodoc
class _$ScoreRecordCopyWithImpl<$Res, $Val extends ScoreRecord>
    implements $ScoreRecordCopyWith<$Res> {
  _$ScoreRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? combo = null,
    Object? accuracy = null,
    Object? playDate = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      combo: null == combo
          ? _value.combo
          : combo // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      playDate: null == playDate
          ? _value.playDate
          : playDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreRecordImplCopyWith<$Res>
    implements $ScoreRecordCopyWith<$Res> {
  factory _$$ScoreRecordImplCopyWith(
          _$ScoreRecordImpl value, $Res Function(_$ScoreRecordImpl) then) =
      __$$ScoreRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int score,
      @HiveField(2) int combo,
      @HiveField(3) double accuracy,
      @HiveField(4) DateTime playDate});
}

/// @nodoc
class __$$ScoreRecordImplCopyWithImpl<$Res>
    extends _$ScoreRecordCopyWithImpl<$Res, _$ScoreRecordImpl>
    implements _$$ScoreRecordImplCopyWith<$Res> {
  __$$ScoreRecordImplCopyWithImpl(
      _$ScoreRecordImpl _value, $Res Function(_$ScoreRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? combo = null,
    Object? accuracy = null,
    Object? playDate = null,
  }) {
    return _then(_$ScoreRecordImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      combo: null == combo
          ? _value.combo
          : combo // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      playDate: null == playDate
          ? _value.playDate
          : playDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreRecordImpl extends _ScoreRecord {
  _$ScoreRecordImpl(
      {@HiveField(1) required this.score,
      @HiveField(2) required this.combo,
      @HiveField(3) required this.accuracy,
      @HiveField(4) required this.playDate})
      : super._();

  factory _$ScoreRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreRecordImplFromJson(json);

  @override
  @HiveField(1)
  final int score;
  @override
  @HiveField(2)
  final int combo;
  @override
  @HiveField(3)
  final double accuracy;
  @override
  @HiveField(4)
  final DateTime playDate;

  @override
  String toString() {
    return 'ScoreRecord(score: $score, combo: $combo, accuracy: $accuracy, playDate: $playDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreRecordImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.combo, combo) || other.combo == combo) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.playDate, playDate) ||
                other.playDate == playDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, score, combo, accuracy, playDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreRecordImplCopyWith<_$ScoreRecordImpl> get copyWith =>
      __$$ScoreRecordImplCopyWithImpl<_$ScoreRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreRecordImplToJson(
      this,
    );
  }
}

abstract class _ScoreRecord extends ScoreRecord {
  factory _ScoreRecord(
      {@HiveField(1) required final int score,
      @HiveField(2) required final int combo,
      @HiveField(3) required final double accuracy,
      @HiveField(4) required final DateTime playDate}) = _$ScoreRecordImpl;
  _ScoreRecord._() : super._();

  factory _ScoreRecord.fromJson(Map<String, dynamic> json) =
      _$ScoreRecordImpl.fromJson;

  @override
  @HiveField(1)
  int get score;
  @override
  @HiveField(2)
  int get combo;
  @override
  @HiveField(3)
  double get accuracy;
  @override
  @HiveField(4)
  DateTime get playDate;
  @override
  @JsonKey(ignore: true)
  _$$ScoreRecordImplCopyWith<_$ScoreRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
