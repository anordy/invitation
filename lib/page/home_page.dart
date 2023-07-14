import 'package:flutter/material.dart';
import 'package:invitation/card/EventCard.dart';
import 'package:invitation/page/screen/event_screen.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [AppColor.prebase, AppColor.base],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //tileMode: TileMode.repeated,
      )),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 70.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.card_giftcard_outlined,
                color: Colors.white70,
              ),
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
          const Text(
            "Hello Gerald",
            style: TextStyle(
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
          Container(
            // color: Colors.red,
            height: Utils.displayHeight(context) * 0.6,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 10),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventScreen()));
                    },
                  child: const EventCard());
                }),
          )
        ]),
      ),
    )));
  }
}
