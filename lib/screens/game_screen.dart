import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:beat_math/providers/exports.dart';
import 'package:beat_math/models/exports.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // ノーツが落下するアニメーションのコントローラ設定
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// ゲームを開始
  void _startGame() {
    ref.read(gameStateProviderProvider.notifier).startGame();
    // ノーツ生成（3レーン想定、10ノーツを生成）
    ref.read(noteProviderProvider.notifier).generateNotes(10);
    // アニメーション開始
    _controller.repeat();
  }

  /// ゲームをリスタート
  void _restartGame() {
    ref.read(gameStateProviderProvider.notifier).restartGame();
    ref.read(noteProviderProvider.notifier).generateNotes(10);
    ref.read(scoreProviderProvider.notifier).resetCombo();
    _controller.repeat();
  }

  /// ゲームを終了
  void _finishGame() {
    ref.read(gameStateProviderProvider.notifier).finishGame();
    _controller.stop();
    _saveHighScore();
  }

  /// ハイスコアを保存
  void _saveHighScore() {
    final score = ref.read(scoreProviderProvider);
    final box = Hive.box<ScoreRecord>('scores');
    box.add(score);
  }

  /// レーン（3つ）の中央に淡い太線を表示
  Widget _buildLanes() {
    return Row(
      children: List.generate(3, (index) {
        return Expanded(
          // レーン1つをStack化し、中に淡い縦線を配置
          child: Stack(
            children: [
              // レーン中央の縦線（淡い色）
              Center(
                child: Container(
                  width: 2,
                  height: double.infinity,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// ノーツ描画
  List<Widget> _buildNotes(List<NoteModel> notes) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // レーン1つあたりの横幅
    final laneWidth = screenWidth / 3;
    // ノーツの見た目上の幅（_NoteWidget で幅80に指定している）
    const noteWidth = 80.0;

    // ノーツが落ちるエリアの高さ (タイミングライン手前まで)
    final noteAreaHeight = screenHeight * 0.75;

    return notes.map((note) {
      // アニメーションでY座標を上→下へ補間
      final animation = Tween<double>(
        begin: -100.0,
        end: noteAreaHeight,
      ).animate(CurvedAnimation(
        parent: _controller,
        // ここはノート毎のタイミングに合わせたい場合に Interval を調整
        curve: Interval(
          (note.timeToHit - DateTime.now().millisecondsSinceEpoch) / 5000,
          1.0,
        ),
      ));

      // ノーツを laneIndex 番目のレーン中央に配置するための計算
      final noteX = note.laneIndex * laneWidth +
          (laneWidth / 2) // レーンの中央
          -
          (noteWidth / 2); // ノーツの幅の半分だけ左にずらして中央寄せ

      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
            left: noteX,
            top: animation.value,
            child: _NoteWidget(note: note),
          );
        },
      );
    }).toList();
  }

  /// 3レーン × 縦3つのボタンを配置 (正解1 + ダミー2想定)
  Widget _buildAnswerButtons(WidgetRef ref) {
    final currentNotes = ref.watch(noteProviderProvider).value ?? [];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (laneIndex) {
        // 各レーンのボタンを縦方向に3つ配置
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (choiceIndex) {
              // laneIndex に該当し、まだ未回答のノートを取得
              final targetNote = currentNotes.firstWhere(
                (note) => note.laneIndex == laneIndex && !note.answered,
                orElse: () => NoteModel(
                  id: '',
                  question: '',
                  answer: 0,
                  choices: const [],
                  laneIndex: laneIndex,
                  timeToHit: 0,
                  answered: true,
                ),
              );

              // choices があれば choiceIndex のテキストを取得
              final choiceText = (targetNote.choices.isNotEmpty &&
                      choiceIndex < targetNote.choices.length)
                  ? targetNote.choices[choiceIndex].toString()
                  : '';

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 50),
                    backgroundColor: _getLaneColor(laneIndex),
                  ),
                  onPressed: targetNote.id.isEmpty
                      ? null
                      : () => _handleAnswer(ref, targetNote, choiceIndex),
                  child: Text(
                    choiceText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  /// レーンごとのボタンカラー (任意で変更)
  Color _getLaneColor(int index) {
    const colors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent,
    ];
    return colors[index % colors.length];
  }

  /// タップした際の判定処理
  void _handleAnswer(WidgetRef ref, NoteModel targetNote, int choiceIndex) {
    if (targetNote.id.isEmpty) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    final isCorrect = targetNote.choices[choiceIndex] == targetNote.answer;
    final timeDiff = (targetNote.timeToHit - now).abs();

    // 判定 (ビートゲーム風)
    final judgement = _calculateJudgement(timeDiff, isCorrect);

    // ノートを更新 (回答済みにする)
    ref.read(noteProviderProvider.notifier).updateNote(
          targetNote.copyWith(
            answered: true,
            judgement: judgement,
          ),
        );

    // スコア加算 or コンボリセット
    if (isCorrect) {
      final points = _calculatePoints(judgement);
      ref.read(scoreProviderProvider.notifier).addScore(points);
    } else {
      ref.read(scoreProviderProvider.notifier).resetCombo();
    }
  }

  /// タイミング判定
  String _calculateJudgement(int timeDiff, bool isCorrect) {
    if (!isCorrect) return 'MISS';

    if (timeDiff <= 80) return 'PERFECT';
    if (timeDiff <= 150) return 'GREAT';
    if (timeDiff <= 300) return 'GOOD';
    return 'MISS';
  }

  /// 判定に応じたスコア
  int _calculatePoints(String judgement) {
    switch (judgement) {
      case 'PERFECT':
        return 100;
      case 'GREAT':
        return 80;
      case 'GOOD':
        return 50;
      default:
        return 0;
    }
  }

  /// スコア表示
  Widget _buildScoreDisplay(ScoreRecord score) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('スコア: ${score.score}'),
          Text('コンボ: ${score.combo}'),
          Text('正解率: ${(score.accuracy * 100).toStringAsFixed(1)}%'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProviderProvider);
    final notesAsync = ref.watch(noteProviderProvider);
    final score = ref.watch(scoreProviderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiplication Beat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          if (gameState == GameState.playing)
            IconButton(
              icon: const Icon(Icons.pause),
              onPressed: _pauseGame,
            ),
          if (gameState == GameState.paused)
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: _resumeGame,
            ),
        ],
      ),
      body: _buildGameContent(gameState, notesAsync, score),
      floatingActionButton: _buildFloatingActionButton(gameState),
    );
  }

  /// 一時停止
  void _pauseGame() {
    ref.read(gameStateProviderProvider.notifier).pauseGame();
    _controller.stop();
  }

  /// 再開
  void _resumeGame() {
    ref.read(gameStateProviderProvider.notifier).startGame();
    _controller.repeat();
  }

  /// メインゲーム画面
  Widget _buildGameContent(
    GameState gameState,
    AsyncValue<List<NoteModel>> notesAsync,
    ScoreRecord score,
  ) {
    switch (gameState) {
      case GameState.initial:
        return Center(
          child: ElevatedButton(
            onPressed: _startGame,
            child: const Text('ゲームを開始'),
          ),
        );
      case GameState.playing:
      case GameState.paused:
        return Column(
          children: [
            // ノーツ表示エリア (上部)
            Expanded(
              flex: 3,
              child: notesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) =>
                    Center(child: Text('エラーが発生しました: $error')),
                data: (notes) {
                  return Stack(
                    children: [
                      // レーン (中央に淡い太線のみ)
                      _buildLanes(),

                      // ノーツ
                      ..._buildNotes(notes),

                      // タイミングライン (太線)
                      Positioned(
                        bottom: 20, // ラインの表示位置を適宜調整
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // 解答ボタンエリア (下部)
            Expanded(
              flex: 1,
              child: _buildAnswerButtons(ref),
            ),

            // スコア表示
            _buildScoreDisplay(score),
          ],
        );
      case GameState.finished:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ゲーム終了！',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Text('最終スコア: ${score.score}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _restartGame,
                child: const Text('もう一度プレイ'),
              ),
            ],
          ),
        );
    }
  }

  /// 停止ボタン
  Widget _buildFloatingActionButton(GameState gameState) {
    if (gameState == GameState.playing || gameState == GameState.paused) {
      return FloatingActionButton(
        onPressed: _finishGame,
        child: const Icon(Icons.stop),
      );
    }
    return Container();
  }
}

/// ノーツの見た目
class _NoteWidget extends StatelessWidget {
  final NoteModel note;

  const _NoteWidget({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          note.question,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
