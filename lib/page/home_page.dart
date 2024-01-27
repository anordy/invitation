import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation/card/EventCard.dart';
import 'package:invitation/features/auth/cubit/auth_cubit.dart';
import 'package:invitation/model/event_model.dart';
import 'package:invitation/network/provider/event_provider.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/screen/event_view_screen.dart';
import 'package:invitation/widget/toast_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String? accessToken;
  String? username;
  bool? isAuth;
  Map<dynamic, dynamic> user = {};

  // _loadUsers() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     accessToken = sharedPreferences.getString('accessToken');
  //     isAuth = sharedPreferences.getBool('isLoggedIn');
  //     username = sharedPreferences.getString('username');
  //   });
  // }

   void fetchUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.decode(prefs.getString('user')!);
    setState(() {
      user = userData;
    });
  }

  void initState() {
    super.initState();
    fetchUserDetails();
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
      child: Padding(
        padding: const EdgeInsets.only(
            top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logout();
                    const LoginScreen().launch(context);
                  },
                  icon: const Icon(
                    Icons.card_giftcard_outlined,
                    color: Colors.white70,
                  )),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset("assets/images/anordy.jpeg"),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Hello ${user['name']}",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "Welcome Back!",
            style: TextStyle(color: Colors.white54, fontSize: 16),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            "EVENTS",
            style: TextStyle(
                color: AppColor.base,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15.0,
          ),
          // Container(
          //   // color: Colors.red,
          //   height: Utils.displayHeight(context) * 0.6,
          //   child: _eventProvider.availableEvents == null ||
          //           _eventProvider.availableEvents.length <= 0
          //       ? const Center(
          //           child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(
          //               Icons.card_giftcard_outlined,
          //               color: Colors.white,
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Text(
          //               "No available event yet",
          //               style: TextStyle(color: Colors.white),
          //             )
          //           ],
          //         ))
          //       : ListView.builder(
          //           scrollDirection: Axis.vertical,
          //           padding: const EdgeInsets.only(top: 10),
          //           itemCount: _eventProvider.availableEvents.length,
          //           itemBuilder: (context, index) {
          //             return InkWell(
          //                 onTap: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => EventViewScreen(
          //                                 id: _eventProvider
          //                                     .availableEvents[index].id
          //                                     .toString(),
          //                               )));
          //                 },
          //                 child: EventCard(
          //                   eventModel: _eventProvider.availableEvents[index],
          //                 ));
          //           }),
          // )
        ]),
      ),
    )));
  }
}
