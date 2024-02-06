import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation/cubits/event/cubit/event_cubit.dart';
import 'package:invitation/cubits/event_scan/cubit/event_scan_cubit.dart';
import 'package:invitation/page/screen/verify_card_screen.dart';
import 'package:invitation/utils/colors.dart';
import 'package:invitation/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class ScanQRCode extends StatefulWidget {
  final String id;
  const ScanQRCode({super.key, required this.id});
  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Future<void> scanQR() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  //   final data = {
  //     "pin": _scanBarcode,
  //     "event_id": this.widget.id,
  //   };
  //   BlocProvider.of<EventScanCubit>(context).scanCard(data);
  // }

Future<void> scanQR() async {
  try {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.QR,
    );

    print('Scanned QR code: $barcodeScanRes');

 setState(() {
      _scanBarcode = barcodeScanRes;
    });
    if (_scanBarcode != '-1') {
      final data = {
        "pin": _scanBarcode,
        "event_id": widget.id,
      };
      BlocProvider.of<EventScanCubit>(context).scanCard(data);
    }
  } on PlatformException catch (e) {
    print('Error during barcode scanning: ${e.message}');
    // Handle the error if necessary
  }
}
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EventCubit>(context).fetchEvent(this.widget.id);
    return MaterialApp(
        home: Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
          height: Utils.displayHeight(context),
          width: Utils.displayWidth(context),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColor.prebase, AppColor.base],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //tileMode: TileMode.repeated,
          )),
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: BlocBuilder<EventCubit, EventState>(
                bloc: EventCubit()..fetchEvent(this.widget.id),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Loader();
                    },
                    success: (event) {
                      return Container(
                        height: Utils.displayHeight(context) * 0.05,
                        child: Text(
                          event.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                    failure: (errorMessage) {
                      print(errorMessage);
                      return Container(
                          height: Utils.displayHeight(context) * 0.05,
                          child: const Text(
                            "No Title available",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "300",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "All",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "50",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "Active",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "50",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "InActive",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
                BlocConsumer<EventScanCubit, EventScanState>(
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return Loader(
                    size: 50,
                  );
                }, orElse: () {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        height: 50,
                        minWidth: Utils.displayWidth(context) * 0.9,
                        color: const Color.fromARGB(179, 2, 37, 62),
                       onPressed: () => scanQR(),
                        child: Text(
                          "SCAN QR".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 16),
                        ),
                      ));
                });
              },
              listener: (context, state) {
                state.maybeWhen(
                    success: (result) {
                      showCustomDialogBasedOnCode(result.code, result.message);
                    },
                    failure: (errorMessage) {
                      showCustomDialogBasedOnCode(500, errorMessage);
                    },
                    orElse: () {});
              },
            ),

            const SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  height: 50,
                  minWidth: Utils.displayWidth(context) * 0.9,
                  color: const Color.fromARGB(179, 2, 37, 62),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                VerifyCardScan(id: this.widget.id)));
                  },
                  child: Text(
                    "VERIFY CARD".toUpperCase(),
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                )),
            // Text('Scan result : $_scanBarcode\n',
            //     style: const TextStyle(fontSize: 20))
          ]));
    })));
  }

    void showCustomDialogBasedOnCode(int code, String message) {
    IconData icon = code == 200 ? Icons.done : Icons.close;
    Color bgColor = code == 200 ? Colors.green : Colors.red;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bgColor,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            height: 100,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 15),
                SizedBox(height: 10),
                Text(message, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }

}
