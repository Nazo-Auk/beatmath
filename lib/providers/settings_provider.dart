import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
class SettingsProvider extends _$SettingsProvider {
  @override
  GameSettings build() {
    return GameSettings(
      volume: 1.0,
      noteSpeed: 1.0,
      soundEffectsEnabled: true,
    );
  }

  // 音量を設定
  void setVolume(double volume) {
    state = state.copyWith(volume: volume);
  }

  // ノーツの落下速度を設定
  void setNoteSpeed(double speed) {
    state = state.copyWith(noteSpeed: speed);
  }

  // 効果音を有効/無効にする
  void toggleSoundEffects(bool enabled) {
    state = state.copyWith(soundEffectsEnabled: enabled);
  }
}

class GameSettings {
  final double volume;
  final double noteSpeed;
  final bool soundEffectsEnabled;

  GameSettings({
    required this.volume,
    required this.noteSpeed,
    required this.soundEffectsEnabled,
  });

  GameSettings copyWith({
    double? volume,
    double? noteSpeed,
    bool? soundEffectsEnabled,
  }) {
    return GameSettings(
      volume: volume ?? this.volume,
      noteSpeed: noteSpeed ?? this.noteSpeed,
      soundEffectsEnabled: soundEffectsEnabled ?? this.soundEffectsEnabled,
    );
  }
}
