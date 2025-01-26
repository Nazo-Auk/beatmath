import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'score_record.freezed.dart';
part 'score_record.g.dart';

@freezed
@HiveType(typeId: 2, adapterName: 'ScoreRecordAdapter')
abstract class ScoreRecord extends HiveObject with _$ScoreRecord {
  ScoreRecord._(); // プライベートコンストラクタ

  factory ScoreRecord({
    @HiveField(1) required int score,
    @HiveField(2) required int combo,
    @HiveField(3) required double accuracy,
    @HiveField(4) required DateTime playDate,
  }) = _ScoreRecord;

  factory ScoreRecord.fromJson(Map<String, dynamic> json) =>
      _$ScoreRecordFromJson(json);
}
