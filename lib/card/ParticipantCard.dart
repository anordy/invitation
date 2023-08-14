
import 'package:flutter/material.dart';

import '../model/participant_model.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class ParticipantCard extends StatefulWidget {
  final ParticipantModel participant;
  const ParticipantCard({
    Key? key,
    required this.participant,
  }) : super(key: key);

  @override
  State<ParticipantCard> createState() => _ParticipantCardState();
}

bool? check = false;

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.displayHeight(context) * .08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.bgScreen,
      ),
      // ignore: prefer_const_constructors
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Utils.displayHeight(context),
            width: Utils.displayWidth(context) * 0.15,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Center(
                    child: Text(
                  widget.participant.icon,
                  style: TextStyle(
                      color: AppColor.base,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          SizedBox(width: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Container(
              width: Utils.displayWidth(context) * 0.6,
              // color: Colors.lightBlueAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.participant.name,
                    style: TextStyle(
                        fontSize: Utils.displayHeight(context) * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: widget.participant.date,
                      style: TextStyle(
                          fontSize: Utils.displayHeight(context) * 0.015,
                          color: Colors.black54),
                    ),
                   
                  ])),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
