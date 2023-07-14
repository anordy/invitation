import 'package:flutter/material.dart';
import 'package:invitation/utils/colors.dart';

import '../utils/utils.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: Utils.displayHeight(context) * 0.15,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: Utils.displayHeight(context) * 0.15,
                  width: Utils.displayWidth(context) * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/ring3.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  child: Container(
                    // height: Utils.displayHeight(context) * 0.12,
                    // width: Utils.displayWidth(context) * 0.5,
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gerald & Paula Wedding",
                          style: TextStyle(
                              fontSize: Utils.displayHeight(context) * 0.02,
                              fontWeight: FontWeight.w500,
                              color: AppColor.base),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              size: 20,
                              color: Colors.white70,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "15 May 2023",
                              style: TextStyle(
                                  fontSize: Utils.displayHeight(context) * 0.014,
                                  color: Colors.white70),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.pin_drop_rounded,
                              size: 20,
                              color: Colors.white70,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Mlimani city",
                              style: TextStyle(
                                  fontSize: Utils.displayHeight(context) * 0.014,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
