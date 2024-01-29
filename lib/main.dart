import 'package:flutter/material.dart';
import 'package:invitation/app.dart';
import 'package:invitation/network/provider/event_provider%20copy.dart';
import 'package:invitation/network/provider/events_provider.dart';
import 'package:invitation/network/provider/participant_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/provider/auth_provider.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  runApp(MultiProvider(providers: [
   ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => EventProvider()),
    ChangeNotifierProvider(create: (_) => ParticipantProvider()),
  ], child: const MyApp()));
}
