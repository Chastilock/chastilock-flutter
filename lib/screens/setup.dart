import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({Key? key}) : super(key: key);
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
          // Here we take the value from the SetupScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Setup"),
        ),
        body: (ListView(padding: const EdgeInsets.all(10), children: [
          Center(
              child: Image.asset(
            'assets/logo.png',
            width: 200,
            height: 200,
          )),
          const Center(
              child: Text("Welcome to Chastilock!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          const Text(
              "Happy to have you on board! If you want, you can either sign in, sign up or continue directly into the app! (You can still connect to an account later).",
              style: TextStyle(fontSize: 16)),

          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Register a new account"))),

          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Take me directly to the app"))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Sign in"))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    print("Testing!!");
                  },
                  child: const Text("Recover using the user id"))),
          //Text(dotenv.get('API_BASE_URL', fallback: 'Not Working')),
        ])));
  }
}
