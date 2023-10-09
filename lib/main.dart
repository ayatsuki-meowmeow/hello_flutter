import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
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
  int _counter = 0;
  String _type = "偶数";
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _type = "偶数";
      } else {
        _type = "奇数";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4.MyHomePageの画面を定義
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
      body: Column(children: [
        const Text("Hello World"),
        const Text("ハローワールド"),
        TextButton(
          onPressed: () => {debugPrint("ボタンが押されたよ")}, // テキストボタンが押されるたびにターミナルに出力
          child: const Text("テキストボタン"),
        ),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 30.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 36.0,
          ),
        ]),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          _type,
          style: const TextStyle(fontSize: 20, color: Colors.red),
        ),
      ]),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => {debugPrint("押したね？")},
      //     child: const Icon(Icons.timer)),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(child: Center(child: Text("ドロワー"))),
      endDrawer: const Drawer(child: Center(child: Text("エンドドロワー"))),
    );
  }
}
