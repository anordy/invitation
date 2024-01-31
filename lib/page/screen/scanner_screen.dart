import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:invitation/utils/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Scanner"),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              _buildQrView(context),
              Positioned(bottom: 10, child: buildResult()),
              Positioned(top: 10, child: buildControlButton())
            ],
          ),
        ),
      );

  Widget buildResult() => Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        barcode != null ? 'Result ${barcode!.code}' : 'Scan a code',
        maxLines: 3,
      ));

  Widget buildControlButton() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
      color: Colors.white24, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: () async {
                await controller!.toggleFlash();
                setState(() {});
              },
              icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                      );
                    } else {
                      return Container();
                    }
                  })),
          IconButton(
              onPressed: () async {
                await controller!.flipCamera();
                setState(() {});
              },
              icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      // ignore: prefer_const_constructors
                      return Icon(
                      Icons.switch_camera,
                      );
                    } else {
                      return Container();
                    }
                  }))
        ],
      ));

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColor.base,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8),
      // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barCode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
