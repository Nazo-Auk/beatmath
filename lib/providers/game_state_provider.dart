import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state_provider.g.dart';

enum GameState {
  initial,
  playing,
  paused,
  finished,
}

@riverpod
class GameStateProvider extends _$GameStateProvider {
  @override
  GameState build() {
    return GameState.initial;
  }

  void startGame() {
    state = GameState.playing;
  }

  void pauseGame() {
    state = GameState.paused;
  }

  void finishGame() {
    state = GameState.finished;
  }

  void restartGame() {
    state = GameState.initial;
  }
}
