import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invitation/utils/colors.dart';

class LoadingDialog extends StatefulWidget {
  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<LoadingDialog> {
// Declare this variable

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Column(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 40, right: 40,),
          margin: const EdgeInsets.only(top: 180),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                 strokeWidth: 2,
                ),
                SizedBox(
                  width: 20,
                ),
                // Some text
                Text('Please wait...',style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
