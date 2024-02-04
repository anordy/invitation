import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:invitation/card/EventCard.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/widget/loading.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../card/ParticipantCard.dart';
import '../../model/participant_model.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class EventViewScreen extends StatefulWidget {
  final String id;
  const EventViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _EventViewScreenState createState() => _EventViewScreenState();
}

class _EventViewScreenState extends State<EventViewScreen>
    with TickerProviderStateMixin {
  ScrollController _ordersController = new ScrollController();
  OtpFieldController otpController = OtpFieldController();
  String _scanBarcode = 'Unknown';

  Barcode? result;
  QRViewController? controller;
  bool _isVerify = false;

  late TabController _tabController;
  List<Widget> list = [
    const Tab(
      text: "SCAN",
    ),
    const Tab(
      text: "ACTIVE",
    ),
  ];
  final statusList = ['Scan', 'Verify'];

  bool changeLanguage = false;
  String currentLocale = "";

  Future<void> scanQR() async {
    // final _eventProvider = Provider.of<EventProvider>(context, listen: false);

    String barcodeScanRes;
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
    // _eventProvider.checkCard(pin: _scanBarcode, eventId: this.widget.id);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.delayed(Duration.zero).then((_) {
      // Provider.of<EventProvider>(context, listen: false)
      //     .fetchEventDetail(id: this.widget.id);
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
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
                        scanCard(),
                        // activeParticipants(),
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
    // final _eventProvider = Provider.of<EventProvider>(context);
    return Container(
        height: Utils.displayHeight(context),
        child: ListView.builder(
            //  controller: _ordersController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: Column(
                        children: [
                          Text(
                            
                                'No Title Available',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                                    "300",
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  const Text(
                                    "All",
                                    style: TextStyle(
                                        color: Colors.white38, fontSize: 16),
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "50",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  Text(
                                    "Active",
                                    style: TextStyle(
                                        color: Colors.white38, fontSize: 16),
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "50",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  Text(
                                    "InActive",
                                    style: TextStyle(
                                        color: Colors.white38, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Container(
                            height: Utils.displayHeight(context) * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Expanded(child: _verifyTextField(context)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: MaterialButton(
                                    height: 50,
                                    minWidth: Utils.displayWidth(context) * 0.3,
                                    color: const Color.fromARGB(179, 2, 37, 62),
                                    onPressed: () async {},
                                    child: const Text(
                                      "VERIFY CARD",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 16),
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: MaterialButton(
                                    height: 50,
                                    minWidth: Utils.displayWidth(context) * 0.3,
                                    color: const Color.fromARGB(179, 2, 37, 62),
                                    onPressed: () => scanQR(),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.scanner_outlined,
                                          color: Colors.white70,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "scan".toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_scanBarcode != null)
                            Text('INVITATION CODE: ${_scanBarcode}')
                          else
                            const Text(''),
                        ],
                      ),
                    );
            }));
  }

// active participants
  // Widget activeParticipants() {
  //       final _participantProvider = Provider.of<ParticipantProvider>(context);
  //   return Container(
  //       height: Utils.displayHeight(context),
  //       // color: Colors.green,
  //       child: ListView.builder(
  //           //  controller: _ordersController,
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           scrollDirection: Axis.vertical,
  //           itemCount: 3,
  //           itemBuilder: (context, index) {
  //             return Padding(
  //                 padding: const EdgeInsets.only(
  //                     left: 15.0, right: 15.0, bottom: 5.0, top: 5),
  //                 child: InkWell(
  //                     onTap: () {},
  //                     child: ParticipantCard(
  //                       participant: _participantProvider.fetchParticipants[index],
  //                     )));
  //           }));
  // }

  Widget _verifyTextField(BuildContext context) {
    // final _eventProvider = Provider.of<EventProvider>(context);
    return Container(
      width: Utils.displayHeight(context) * 0.6,
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: Column(
        children: [
          OTPTextField(
              controller: otpController,
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.underline,
              outlineBorderRadius: 15,
              otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: Colors.white,
                  disabledBorderColor: AppColor.base),
              style: const TextStyle(fontSize: 17, color: Colors.white),
              onChanged: (pin) {
                print("*****************************");
                print("Changed: " + pin);
              },
              onCompleted: (pin) {
                print("*****************************");
                print("Completed: " + pin);
                // _eventProvider.checkCard(pin: pin, eventId: this.widget.id);
                otpController.clear();
              }),
        ],
      ),
    );
  }
}
