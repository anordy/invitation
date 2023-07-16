import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/Auth/onboarding/onboarding_screen.dart';
import 'package:invitation/page/Auth/otp_screen.dart';
import 'package:invitation/page/Auth/splash_screen.dart';
import 'package:invitation/page/home_page.dart';
import 'package:invitation/page/screen/event_screen.dart';
import 'package:oktoast/oktoast.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
          title: 'Invitation Card',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //home: SplashScreen(),
          initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
          routes: {
            "/": (context) => SplashScreen(),
            "first": (context) => Scaffold(body: OnBoardingScreen())
          }
          ),
    );
  }
}
