import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:chastilock/router.gr.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final router = AutoRouter.of(context);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the SetupPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Setup'),
        ),
        body: (ListView(padding: const EdgeInsets.all(10), children: [
          Center(
              child: Image.asset(
            'assets/logo.png',
            width: 200,
            height: 200,
          )),
          const Center(
              child: Text('Welcome to Chastilock!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          const Text(
              'Happy to have you on board! If you want, you can either sign in, sign up or continue directly into the app! (You can still connect to an account later).',
              style: TextStyle(fontSize: 16)),
          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Register a new account'))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    router.push(const CreateAnonRoute());
                  },
                  child: const Text('Take me directly to the app'))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    router.push(const LoginRoute());
                  },
                  child: const Text('Sign in'))),
          Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    router.push(const LoginAnonRoute());
                  },
                  child: const Text('Recover using the user id'))),
        ])));
  }
}
