
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
      height: Utils.displayHeight(context),
      width: Utils.displayWidth(context),
      decoration:  BoxDecoration(
          gradient: LinearGradient(
        colors: [AppColor.prebase, AppColor.base],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //tileMode: TileMode.repeated,
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 60.0),
        //   child: SvgPicture.asset('assets/icons/Laye.svg'),
        // ),
        SizedBox(height: Utils.displayHeight(context) * 0.4),
        RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: const <TextSpan>[
              TextSpan(
                  text: "Card",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                      color: Color(0xFFFFFFFF)))
            ],
            text: "Wedding",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                color: Colors.grey[600]),
          ),
        ),
      ]),
    )));
  }
  
}



