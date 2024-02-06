import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invitation/card/EventCard.dart';
import 'package:invitation/cubits/events/cubit/event_list_cubit.dart';
import 'package:invitation/features/auth/cubit/auth_cubit.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/screen/scan_qr_screen.dart';
import 'package:nb_utils/nb_utils.dart';
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
                  FontAwesomeIcons.rightFromBracket,
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
          BlocBuilder<EventListCubit, EventListState>(
            bloc: EventListCubit()..fetchEventLists(),
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Loader();
                },
                success: (events) {
                  return Container(
                    height: Utils.displayHeight(context) * 0.6,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScanQRCode(id: events[index].id.toString(),)));
                              },
                              child: EventCard(
                                eventModel: events[index],
                              ));
                        }),
                  );
                },
                failure: (errorMessage) {
                  return Container(
                    height: Utils.displayHeight(context) * 0.6,
                    child:  Text("Something Went Wrong")
                  );
                  // Fluttertoast.showToast(
                  //   msg: errorMessage,
                  //   toastLength: Toast.LENGTH_LONG,
                  //   gravity: ToastGravity.BOTTOM,
                  //   timeInSecForIosWeb: 5,
                  //   backgroundColor: Colors.red,
                  //   textColor: Colors.white,
                  //   fontSize: 16.0,
                  // );
                },
              );
            },
          ),

         
        ]),
      ),
    )));
  }
}
