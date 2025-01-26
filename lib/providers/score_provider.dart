import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:beat_math/models/exports.dart';

part 'score_provider.g.dart';

@riverpod
class ScoreProvider extends _$ScoreProvider {
  @override
  ScoreRecord build() {
    return ScoreRecord(
      score: 0,
      combo: 0,
      accuracy: 1.0,
      playDate: DateTime.now(),
    );
  }

  // スコアを追加
  void addScore(int points) {
    state = state.copyWith(
      score: state.score + points,
      combo: state.combo + 1,
    );
  }

  // コンボをリセット
  void resetCombo() {
    state = state.copyWith(combo: 0);
  }

  // 正解率を更新
  void updateAccuracy(int total, int correct) {
    state = state.copyWith(
      accuracy: correct / total,
    );
  }

  // ハイスコアを更新
  void updateHighScore(int newScore) {
    if (newScore > state.score) {
      state = state.copyWith(score: newScore);
    }
  }
}
