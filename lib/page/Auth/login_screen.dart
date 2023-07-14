import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/otp_screen.dart';
import 'package:invitation/page/home_page.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  _setCountry(CountryCode code) {
    print(code.toString());
  }

  String code = "TZ";
  String phone = "";
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
        padding: const EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.card_giftcard,
                color: AppColor.base,
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text(
                "Invitation",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.1,
          ),
          const Text(
            "Enter Your \n Mobile number",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.02,
          ),
          // Text(
          //   "You will receive a 4 digits code to verify next",
          //   style: TextStyle(color: AppColor.text, fontSize: 12),
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white70),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: CountryCodePicker(
                    flagWidth: 30,
                    onChanged: _setCountry,
                    initialSelection: code,
                    alignLeft: true,
                  ),
                ),
                Container(
                  width: 180,
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        hintMaxLines: 1, hintText: "716121689"),
                    onChanged: (text) {
                      this.phone = text;
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.035,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                height: 50,
                minWidth: Utils.displayWidth(context) * 0.35,
                color: const Color.fromARGB(179, 1, 59, 101),
                onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                },
                child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
              ))
        ]),
      ),
    )));
  }
}
