import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'gen/assets.gen.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppを呼び出す
  runApp(const MyApp());
}

// MyAppクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 3. タイトルとテーマを設定。画面の本体はMyHomePageクラスで定義
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // 色の設定
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
            // 背景色の設定
            .copyWith(background: Colors.blueGrey),
        // 文字の装飾
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        useMaterial3: true,
      ),
      // ダークモードの設定
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      //ローカライゼーション(日本語化対応)
      // localizationsDelegates: const [
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      localizationsDelegates: L10n.localizationsDelegates,
      // supportedLocales: const [
      //   Locale('ja', 'JP'),
      // ],
      supportedLocales: L10n.supportedLocales,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    // 4.MyHomePageの画面を定義
    Intl.defaultLocale =
        Localizations.localeOf(context).toString(); // 日付のローカライゼーション
    final l10n = L10n.of(context); // 文字列のローカライゼーション
    return Scaffold(
      // 画面上部のタイトルバー
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Row(children: [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Text("Hello World"),
          Text(l10n.helloWorld), // ローカライゼーションされる文字列
          Text(DateFormat.yMEd().format(DateTime.now())), // ローカライゼーションされる日付
          TextButton(
            onPressed: () =>
                {debugPrint("ボタンが押されたよ")}, // テキストボタンが押されるたびにターミナルに出力
            child: const Text("テキストボタン"),
          ),
          // const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //   Icon(
          //     Icons.favorite,
          //     color: Colors.pink,
          //     size: 24.0,
          //   ),
          //   Icon(
          //     Icons.audiotrack,
          //     color: Colors.green,
          //     size: 30.0,
          //   ),
          //   Icon(
          //     Icons.beach_access,
          //     color: Colors.blue,
          //     size: 36.0,
          //   ),
          // ]),
          // const TextField(),
          // flutter_genを使わずassetsの画像を表示
          // Image.asset('assets/circle.png'),
          // flutter_genを使ってassetsの画像を表示
          Assets.circle.image(),
          // svgファイルの表示。解像度を気にしなくていい
          Assets.check.svg(
            width: 100,
            height: 100,
          ),
          Text(
            '$_number',
          ),
          ElevatedButton(
            child: const Text('次へ'),
            onPressed: () async {
              final newNum = await Navigator.of(context).push<int>(
                MaterialPageRoute(
                  builder: (_) => SecondPage(number: _number),
                ),
              );
              setState(() {
                if (newNum != null) _number = newNum;
              });
            },
          )
        ]),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("押したね？");
            setState(() {
              _number++;
            });
          },
          child: const Icon(Icons.add)),
      drawer: const Drawer(child: Center(child: Text("ドロワー"))),
      endDrawer: const Drawer(child: Center(child: Text("エンドドロワー"))),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number: $number'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(number + 1),
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(number - 1),
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
