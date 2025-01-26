// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModelAdapter extends TypeAdapter<_$NoteModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$NoteModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$NoteModelImpl(
      id: fields[1] as String,
      question: fields[2] as String,
      answer: fields[3] as int,
      choices: (fields[4] as List).cast<int>(),
      laneIndex: fields[5] as int,
      timeToHit: fields[6] as int,
      answered: fields[7] as bool,
      judgement: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$NoteModelImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.answer)
      ..writeByte(5)
      ..write(obj.laneIndex)
      ..writeByte(6)
      ..write(obj.timeToHit)
      ..writeByte(7)
      ..write(obj.answered)
      ..writeByte(8)
      ..write(obj.judgement)
      ..writeByte(4)
      ..write(obj.choices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteModelImpl _$$NoteModelImplFromJson(Map<String, dynamic> json) =>
    _$NoteModelImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: (json['answer'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      laneIndex: (json['laneIndex'] as num).toInt(),
      timeToHit: (json['timeToHit'] as num).toInt(),
      answered: json['answered'] as bool,
      judgement: json['judgement'] as String?,
    );

Map<String, dynamic> _$$NoteModelImplToJson(_$NoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'choices': instance.choices,
      'laneIndex': instance.laneIndex,
      'timeToHit': instance.timeToHit,
      'answered': instance.answered,
      'judgement': instance.judgement,
    };
