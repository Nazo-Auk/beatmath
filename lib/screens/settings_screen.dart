import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beat_math/providers/exports.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProviderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildVolumeSlider(ref, settings),
          _buildNoteSpeedSlider(ref, settings),
          _buildSoundEffectsSwitch(ref, settings),
        ],
      ),
    );
  }

  Widget _buildVolumeSlider(WidgetRef ref, GameSettings settings) {
    return ListTile(
      title: const Text('音量'),
      subtitle: Slider(
        value: settings.volume,
        min: 0.0,
        max: 1.0,
        onChanged: (value) {
          ref.read(settingsProviderProvider.notifier).setVolume(value);
        },
      ),
    );
  }

  Widget _buildNoteSpeedSlider(WidgetRef ref, GameSettings settings) {
    return ListTile(
      title: const Text('ノーツの落下速度'),
      subtitle: Slider(
        value: settings.noteSpeed,
        min: 0.5,
        max: 2.0,
        onChanged: (value) {
          ref.read(settingsProviderProvider.notifier).setNoteSpeed(value);
        },
      ),
    );
  }

  Widget _buildSoundEffectsSwitch(WidgetRef ref, GameSettings settings) {
    return SwitchListTile(
      title: const Text('効果音'),
      value: settings.soundEffectsEnabled,
      onChanged: (value) {
        ref.read(settingsProviderProvider.notifier).toggleSoundEffects(value);
      },
    );
  }
}
