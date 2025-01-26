import 'package:beat_math/models/exports.dart';
import 'package:beat_math/screens/game_screen.dart';
import 'package:beat_math/screens/settings_screen.dart';

void main() async {
  // Hiveの初期化
  await Hive.initFlutter();

  // アダプターの登録
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(ScoreRecordAdapter());

  // ボックスのオープン
  await Hive.openBox<NoteModel>('notes');
  await Hive.openBox<ScoreRecord>('scores');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiplication Beat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GameScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
