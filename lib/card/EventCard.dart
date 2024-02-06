import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/utils/colors.dart';

import '../utils/utils.dart';

class EventCard extends StatelessWidget {
  final EventDatum eventModel;
  const EventCard({super.key, required this.eventModel});

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
                          eventModel.title,
                          style: TextStyle(
                              fontSize: Utils.displayHeight(context) * 0.02,
                              fontWeight: FontWeight.w500,
                              color: AppColor.base),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              FontAwesomeIcons.locationDot,
                              size: 18,
                              color: Colors.white70,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              eventModel.venue,
                              style: TextStyle(
                                  fontSize:
                                      Utils.displayHeight(context) * 0.014,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            DateFormat('yyyy-MM-dd').format(eventModel.startDate),
                            style: TextStyle(
                              fontSize: Utils.displayHeight(context) * 0.014,
                              color: Colors.white70,
                            ),
                          ),
                          ],
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
