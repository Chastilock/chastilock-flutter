import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:chastilock/router.gr.dart';

class LoadLockPage extends StatelessWidget {
  const LoadLockPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final _router = AutoRouter.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Load Lock'),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: [
          Center(
            child: ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('Load QR Code Using Camera'),
                onPressed: () => {_router.push(const LoadLockCameraRoute())}),
          )
        ]));
  }
}
