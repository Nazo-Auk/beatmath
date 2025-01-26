import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:beat_math/models/exports.dart';

part 'note_provider.g.dart';

@riverpod
class NoteProvider extends _$NoteProvider {
  @override
  Future<List<NoteModel>> build() async {
    // 初期データとして空のリストを返す
    return [];
  }

  // ノーツを追加
  Future<void> addNote(NoteModel note) async {
    final notes = await future;
    state = AsyncValue.data([...notes, note]);
  }

  // ノーツを削除
  Future<void> removeNote(String id) async {
    final notes = await future;
    state = AsyncValue.data(notes.where((note) => note.id != id).toList());
  }

  // ノーツを更新
  Future<void> updateNote(NoteModel updatedNote) async {
    final notes = await future;
    state = AsyncValue.data(
      notes
          .map((note) => note.id == updatedNote.id ? updatedNote : note)
          .toList(),
    );
  }

  // ゲーム開始時にノーツを生成
  Future<void> generateNotes(int count) async {
    final notes = List.generate(count, (index) => _createRandomNote(index));
    state = AsyncValue.data(notes);
  }

  // ランダムなノーツを作成
  NoteModel _createRandomNote(int index) {
    final a = _randomNumber(10, 99);
    final b = _randomNumber(10, 99);
    final answer = a * b;
    final choices = _generateChoices(answer);

    return NoteModel(
      id: 'note_$index',
      question: '$a × $b',
      answer: answer,
      choices: choices,
      laneIndex: _randomNumber(0, 3),
      timeToHit: DateTime.now().millisecondsSinceEpoch + 5000,
      answered: false,
    );
  }

  // ランダムな数字を生成
  int _randomNumber(int min, int max) {
    return min + (DateTime.now().millisecond % (max - min));
  }

  // 選択肢を生成
  List<int> _generateChoices(int correctAnswer) {
    final choices = [correctAnswer];
    while (choices.length < 3) {
      final randomAnswer =
          _randomNumber(correctAnswer - 50, correctAnswer + 50);
      if (!choices.contains(randomAnswer)) {
        choices.add(randomAnswer);
      }
    }
    return choices..shuffle();
  }
}
