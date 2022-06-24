import 'package:chastilock/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chastilock/state/session_manager.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
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
          title: const Text('Settings'),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  SessionManager().destroySession();
                  router.popUntilRoot();
                  router.replace(const SetupRoute());
                },
                child: const Text('Log out'),
              ))
        ]));
  }
}
