import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:chastilock/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _router = AutoRouter.of(context);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  _router.push(const SettingsRoute());
                },
                icon: const Icon(Icons.settings, color: Colors.white))
          ],
        ),
        body: const Text("Logged in!!"));
  }
}
