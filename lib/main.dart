import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chastilock',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Chastilock - Welcome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: (ListView(padding: EdgeInsets.all(10), children: [
          Center(
              child: Image.asset(
            'logo.png',
            //Test again on Android (failed when testing it previously)
            width: 200,
            height: 200,
          )),
          Center(
              child: Text("Welcome to Chastilock!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Text(
              "Happy to have you on board! If you want, you can either sign in, sign up or continue directly into the app! (You can still connect to an account later).",
              style: TextStyle(fontSize: 16)),

          Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Register a new account"))),

          Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Take me directly to the app"))),
          Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(onPressed: () {}, child: Text("Sign in"))),
          Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Recover using the user id"))),
          //Text(dotenv.get('API_BASE_URL', fallback: 'Not Working')),
        ])));
  }
}