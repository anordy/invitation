import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:invitation/card/EventCard.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  ScrollController _ordersController = new ScrollController();
    OtpFieldController otpController = OtpFieldController();

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TabController? _tabController;
  List<Widget> list = [
    const Tab(
      text: "SCAN",
    ),
    const Tab(
      text: "VERIFY",
    ),
  ];
  final statusList = ['Scan', 'Verify'];

  bool changeLanguage = false;
  String currentLocale = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.prebase,
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [AppColor.prebase, AppColor.base],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //tileMode: TileMode.repeated,
            )),
            child: CustomScrollView(
              slivers: [
                SliverStickyHeader(
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFD9D0E3)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TabBar(
                          tabAlignment: TabAlignment.fill,
                          indicatorSize: TabBarIndicatorSize.tab,
                          controller: _tabController,
                          indicator: BoxDecoration(
                              color: AppColor.base,
                              borderRadius: BorderRadius.circular(15)),
                          // indicatorColor: AppColor.base,
                          labelColor: Colors.white,
                          unselectedLabelColor: const Color(0xFF1F212C),
                          tabs: list,
                          onTap: (index) {
                            // Tab index when user select it, it start from zero
                          },
                        ),
                      ),
                    ),
                  ),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      height: Utils.displayHeight(context),
                      color: Colors.transparent,
                      child: TabBarView(controller: _tabController, children: [
                        scanCard(),
                        verifyCard(),
                      ]),
                    ),
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scanCard() {
    return Container(
        height: Utils.displayHeight(context),
        // color: Colors.green,
        child: ListView.builder(
            //  controller: _ordersController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Column(
                  children: [
                     const Text(
            "Gerald & Paula Wedding",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Column(
                children: [
                  Text(
                    "100",
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
            height: 25.0,
          ),
                    Container(
                      height: Utils.displayHeight(context) * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10)),
                            child:Expanded(child: _buildQrView(context)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              height: 50,
                              minWidth: Utils.displayWidth(context) * 0.3,
                              color: const Color.fromARGB(179, 1, 59, 101),
                              onPressed: () async {
                                await controller?.pauseCamera();
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.pause,color: Colors.white70,),
                                  SizedBox(width: 10,),
                                  Text(
                                    "PAUSE",
                                    style:
                                        TextStyle(color: Colors.white70, fontSize: 16),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(width: 10,),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              height: 50,
                              minWidth: Utils.displayWidth(context) * 0.3,
                              color: const Color.fromARGB(179, 1, 59, 101),
                              onPressed: () async {
                                await controller?.resumeCamera();
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.play_arrow,color: Colors.white70,),
                                  SizedBox(width: 10,),
                                  Text(
                                    "RESUME",
                                    style:
                                        TextStyle(color: Colors.white70, fontSize: 16),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
SizedBox(height: 20,),
                     if (result != null)
                    Text(
                        'QRCODE Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text(''),
                  ],
                ),
              );
            }));
  }

// ===== verify   =======
 Widget verifyCard() {
    return Container(
        height: Utils.displayHeight(context),
        // color: Colors.green,
        child: ListView.builder(
            //  controller: _ordersController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Column(
                  children: [
                     const Text(
            "Gerald & Paula Wedding",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Column(
                children: [
                  Text(
                    "100",
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
            height: 25.0,
          ),
                         Container(
            width: Utils.displayHeight(context) * 0.6,
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                otpFieldStyle: OtpFieldStyle(enabledBorderColor: Colors.white,disabledBorderColor: AppColor.base),
                style: const TextStyle(fontSize: 17,color: Colors.white),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
          ),
                    const SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              height: 50,
                              minWidth: Utils.displayWidth(context) * 0.3,
                              color: const Color.fromARGB(179, 1, 59, 101),
                              onPressed: () async {
                                await controller?.resumeCamera();
                              },
                              child: const Text(
                                    "VERIFY CARD",
                                    style:
                                        TextStyle(color: Colors.white70, fontSize: 16),
                                  ),)),
                 ],
                ),
              );
            }));
  }

    Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 350.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColor.base,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 7,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }
 void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
