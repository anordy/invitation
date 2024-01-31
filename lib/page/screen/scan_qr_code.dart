import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:invitation/network/provider/events_provider.dart';
import 'package:invitation/page/screen/verify_card_screen.dart';
import 'package:invitation/utils/colors.dart';
import 'package:invitation/utils/utils.dart';
import 'package:provider/provider.dart';

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
    Future.delayed(Duration.zero).then((_) {
      Provider.of<EventProvider>(context, listen: false)
          .fetchEventDetail(id: this.widget.id);
    });
  }

  Future<void> scanQR() async {
    final _eventProvider = Provider.of<EventProvider>(context,listen: false);
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
        _eventProvider.checkCard(pin: _scanBarcode, eventId: this.widget.id);

  }

  @override
  Widget build(BuildContext context) {
        final _eventProvider = Provider.of<EventProvider>(context);
    return MaterialApp(
        home: Scaffold(
        
            body: Builder(builder: (BuildContext context) {
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
                  child: Column(
                  
                      children: <Widget>[
                         Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                _eventProvider.availableEventDetail?.data.title ??
                    'No Title Available',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "${_eventProvider.availableEventDetail?.data.capasity}",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const Text(
                      "All",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
                const Column(
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
                const Column(
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
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              height: 50,
                              minWidth: Utils.displayWidth(context) * 0.3,
                              color: const Color.fromARGB(179, 2, 37, 62),
                              onPressed: () => scanQR(),
                              child: const Text(
                                "SCAN",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              height: 50,
                              minWidth: Utils.displayWidth(context) * 0.3,
                              color: const Color.fromARGB(179, 2, 37, 62),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyCardScan(
                                            id: this.widget.id)));
                              },
                              child: const Text(
                                "VERIFY CARD",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                            )),
                           
                        Text('Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));
  }
}
