import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoadLockFromIDPage extends StatelessWidget {
  const LoadLockFromIDPage(
      {Key? key, @QueryParam('lockId') required this.lockId})
      : super(
          key: key,
        );
  final String? lockId;

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
          Text(lockId!)
          //Need to get the ID passed either from a deeplink, image from gallery or QR Code scanner
          //Needs adding to router
        ]));
  }
}
