// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScoreRecordAdapter extends TypeAdapter<ScoreRecord> {
  @override
  final int typeId = 2;

  @override
  ScoreRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScoreRecord(
      score: fields[1] as int,
      combo: fields[2] as int,
      accuracy: fields[3] as double,
      playDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ScoreRecord obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.combo)
      ..writeByte(3)
      ..write(obj.accuracy)
      ..writeByte(4)
      ..write(obj.playDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreRecordImpl _$$ScoreRecordImplFromJson(Map<String, dynamic> json) =>
    _$ScoreRecordImpl(
      score: (json['score'] as num).toInt(),
      combo: (json['combo'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
      playDate: DateTime.parse(json['playDate'] as String),
    );

Map<String, dynamic> _$$ScoreRecordImplToJson(_$ScoreRecordImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'combo': instance.combo,
      'accuracy': instance.accuracy,
      'playDate': instance.playDate.toIso8601String(),
    };
