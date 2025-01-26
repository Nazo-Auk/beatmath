import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
abstract class NoteModel extends HiveObject with _$NoteModel {
  NoteModel._(); // プライベートコンストラクタ

  @HiveType(typeId: 1, adapterName: 'NoteModelAdapter')
  factory NoteModel({
    @HiveField(1) required String id,
    @HiveField(2) required String question,
    @HiveField(3) required int answer,
    @HiveField(4) required List<int> choices,
    @HiveField(5) required int laneIndex,
    @HiveField(6) required int timeToHit,
    @HiveField(7) required bool answered,
    @HiveField(8) String? judgement,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
