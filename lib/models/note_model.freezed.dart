// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) {
  return _NoteModel.fromJson(json);
}

/// @nodoc
mixin _$NoteModel {
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get question => throw _privateConstructorUsedError;
  @HiveField(3)
  int get answer => throw _privateConstructorUsedError;
  @HiveField(4)
  List<int> get choices => throw _privateConstructorUsedError;
  @HiveField(5)
  int get laneIndex => throw _privateConstructorUsedError;
  @HiveField(6)
  int get timeToHit => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get answered => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get judgement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res, NoteModel>;
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String question,
      @HiveField(3) int answer,
      @HiveField(4) List<int> choices,
      @HiveField(5) int laneIndex,
      @HiveField(6) int timeToHit,
      @HiveField(7) bool answered,
      @HiveField(8) String? judgement});
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res, $Val extends NoteModel>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? choices = null,
    Object? laneIndex = null,
    Object? timeToHit = null,
    Object? answered = null,
    Object? judgement = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      laneIndex: null == laneIndex
          ? _value.laneIndex
          : laneIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeToHit: null == timeToHit
          ? _value.timeToHit
          : timeToHit // ignore: cast_nullable_to_non_nullable
              as int,
      answered: null == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool,
      judgement: freezed == judgement
          ? _value.judgement
          : judgement // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteModelImplCopyWith<$Res>
    implements $NoteModelCopyWith<$Res> {
  factory _$$NoteModelImplCopyWith(
          _$NoteModelImpl value, $Res Function(_$NoteModelImpl) then) =
      __$$NoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String question,
      @HiveField(3) int answer,
      @HiveField(4) List<int> choices,
      @HiveField(5) int laneIndex,
      @HiveField(6) int timeToHit,
      @HiveField(7) bool answered,
      @HiveField(8) String? judgement});
}

/// @nodoc
class __$$NoteModelImplCopyWithImpl<$Res>
    extends _$NoteModelCopyWithImpl<$Res, _$NoteModelImpl>
    implements _$$NoteModelImplCopyWith<$Res> {
  __$$NoteModelImplCopyWithImpl(
      _$NoteModelImpl _value, $Res Function(_$NoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? choices = null,
    Object? laneIndex = null,
    Object? timeToHit = null,
    Object? answered = null,
    Object? judgement = freezed,
  }) {
    return _then(_$NoteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      laneIndex: null == laneIndex
          ? _value.laneIndex
          : laneIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeToHit: null == timeToHit
          ? _value.timeToHit
          : timeToHit // ignore: cast_nullable_to_non_nullable
              as int,
      answered: null == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool,
      judgement: freezed == judgement
          ? _value.judgement
          : judgement // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'NoteModelAdapter')
class _$NoteModelImpl extends _NoteModel {
  _$NoteModelImpl(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.question,
      @HiveField(3) required this.answer,
      @HiveField(4) required final List<int> choices,
      @HiveField(5) required this.laneIndex,
      @HiveField(6) required this.timeToHit,
      @HiveField(7) required this.answered,
      @HiveField(8) this.judgement})
      : _choices = choices,
        super._();

  factory _$NoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteModelImplFromJson(json);

  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String question;
  @override
  @HiveField(3)
  final int answer;
  final List<int> _choices;
  @override
  @HiveField(4)
  List<int> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  @HiveField(5)
  final int laneIndex;
  @override
  @HiveField(6)
  final int timeToHit;
  @override
  @HiveField(7)
  final bool answered;
  @override
  @HiveField(8)
  final String? judgement;

  @override
  String toString() {
    return 'NoteModel(id: $id, question: $question, answer: $answer, choices: $choices, laneIndex: $laneIndex, timeToHit: $timeToHit, answered: $answered, judgement: $judgement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.laneIndex, laneIndex) ||
                other.laneIndex == laneIndex) &&
            (identical(other.timeToHit, timeToHit) ||
                other.timeToHit == timeToHit) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.judgement, judgement) ||
                other.judgement == judgement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      answer,
      const DeepCollectionEquality().hash(_choices),
      laneIndex,
      timeToHit,
      answered,
      judgement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      __$$NoteModelImplCopyWithImpl<_$NoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteModelImplToJson(
      this,
    );
  }
}

abstract class _NoteModel extends NoteModel {
  factory _NoteModel(
      {@HiveField(1) required final String id,
      @HiveField(2) required final String question,
      @HiveField(3) required final int answer,
      @HiveField(4) required final List<int> choices,
      @HiveField(5) required final int laneIndex,
      @HiveField(6) required final int timeToHit,
      @HiveField(7) required final bool answered,
      @HiveField(8) final String? judgement}) = _$NoteModelImpl;
  _NoteModel._() : super._();

  factory _NoteModel.fromJson(Map<String, dynamic> json) =
      _$NoteModelImpl.fromJson;

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get question;
  @override
  @HiveField(3)
  int get answer;
  @override
  @HiveField(4)
  List<int> get choices;
  @override
  @HiveField(5)
  int get laneIndex;
  @override
  @HiveField(6)
  int get timeToHit;
  @override
  @HiveField(7)
  bool get answered;
  @override
  @HiveField(8)
  String? get judgement;
  @override
  @JsonKey(ignore: true)
  _$$NoteModelImplCopyWith<_$NoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
