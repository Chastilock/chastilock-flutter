import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:chastilock/router.gr.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class LoadLockCameraPage extends StatelessWidget {
  const LoadLockCameraPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final _router = AutoRouter.of(context);
    final MobileScannerController mController =
        MobileScannerController(facing: CameraFacing.back);

    return Scaffold(
        body: MobileScanner(
            controller: mController,
            onDetect: (barcode, args) {
              final String? code = barcode.rawValue;
              mController.stop();
              _router.pop();
              _router.push(LoadLockFromIDRoute(lockId: code!));

              //Works but going back from here results in an error for some reason...
            }));
  }
}
