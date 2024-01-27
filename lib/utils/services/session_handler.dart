import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionTimer {
  static Timer? timer;

  static void startTimer(BuildContext context) {
    timer = Timer.periodic(
      const Duration(days: 1),
      (_) {
        timedOut(context);
      },
    );
  }

  static void userActivityDetected(BuildContext context) {
    if (timer != null) {
      timer?.cancel();
      startTimer(context);
    }
    return;
  }

  static void removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      prefs.remove('user');
    }
  }

  static Future<void> timedOut(BuildContext context) async {
    timer!.cancel();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text(
            'Sorry but you have been logged out due to inactivity...'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              removeToken();
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
