import 'package:flutter/material.dart';
import 'package:invitation/utils/colors.dart';

import '../utils/utils.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: [
          Container(
            height: Utils.displayHeight(context) * 0.4,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10)),
          //       child: Expanded(
          //   flex: 5,
          //   child: QRView(
          //     key: qrKey,
          //     onQRViewCreated: _onQRViewCreated,
          //   ),
          // ),
          ),
          SizedBox(height: 30,),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                height: 50,
                minWidth: Utils.displayWidth(context) * 0.35,
                color: const Color.fromARGB(179, 1, 59, 101),
                onPressed: () {
                  //  Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const OtpScreen()));
                },
                child: const Text(
                      "SCAN CARD",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
              ))
        ],
      ),
    );
  }
}
