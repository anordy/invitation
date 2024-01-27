import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/Auth/login_screen_bloc.dart';
import 'package:invitation/page/home_page.dart';
import 'package:invitation/page/home_page_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? accessToken;
  _checkIfUserIsLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPreferences.getBool("isLoggedIn");
    accessToken = sharedPreferences.getString("accessToken");
    String? username = sharedPreferences.getString("username");
    print("Loggin: ${isLoggedIn}");
    print("********  Access Token ***********");
    print(accessToken);
    if (isLoggedIn != null && isLoggedIn) {
      print("islogged in");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print("islogged out");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    print("Init splash");
    // SharedPreferences.setMockInitialValues({});
    Future.delayed(const Duration(seconds: 2), () {
      _checkIfUserIsLoggedIn();
      print("after splash");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (Container(
      height: Utils.displayHeight(context),
      width: Utils.displayWidth(context),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [AppColor.prebase, AppColor.base],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //tileMode: TileMode.repeated,
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset('assets/images/inv1.png',color: Colors.white,),

        SizedBox(height: Utils.displayHeight(context) * 0.2),
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
            text: "Invitation",
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
