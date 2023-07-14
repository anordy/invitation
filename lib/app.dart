
import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/Auth/onboarding/onboarding_screen.dart';
import 'package:invitation/page/Auth/otp_screen.dart';
import 'package:invitation/page/home_page.dart';
import 'package:invitation/page/screen/event_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invitation Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   OnBoardingScreen(),
    );
  }
}

