import 'package:flutter/material.dart';
import 'package:invitation/utils/utils.dart';


class SplashPageWidget extends StatefulWidget {
  _SplashPageWidget createState() => _SplashPageWidget();
}

class _SplashPageWidget extends State<SplashPageWidget> {
  // String baseUrl = "http://localhost:8080/api/";
  // String baseUrl = "http://dev.superstore.co.tz:8080/api/";
  // String baseUrl = "https://3a3bc82c8a50.ngrok.io/api/";
  String baseUrl = "http://api.staging.superstore.co.tz/api/";

  @override
  void initState() {
    super.initState();
    print("Init splash");
    // SharedPreferences.setMockInitialValues({});
    Future.delayed(const Duration(seconds: 3), () {
      print("after splash");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
                home: Scaffold(
          body: Container(
            // color: Color.fromRGBO(227, 5, 32, 1),
            color: Color(0xFFFFFFFF),
            width: Utils.displayWidth(context),
            height: Utils.displayHeight(context),
            child: Stack(
              children: [
                Positioned(
                  top: Utils.displayHeight(context) * 0.32,
                  right: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                        // color: Colors.green,
                        height: Utils.displayHeight(context) * 0.09,
                        width: Utils.displayWidth(context) * 0.8,
                        child: Image.asset("assets/images/redlogoxl.jpeg")),
                  ),
                ),
                Positioned(
                    bottom: -4,
                    // left: 80,
                    right: 0,
                    child: Container(
                      height: Utils.displayHeight(context) * 0.28,
                      // color: Colors.green,
                      child: Image.asset(
                        "assets/images/logo1.png",
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
