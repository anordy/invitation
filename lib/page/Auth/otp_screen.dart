import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:invitation/page/home_page.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
  }

  OtpFieldController otpController = OtpFieldController();

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
            "Enter your OTP received \n +255 716 *** *89",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.02,
          ),
          Text(
            "You will receive a 4 digits code to verify next",
            style: TextStyle(color: AppColor.text, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.02,
          ),
          Container(
            width: Utils.displayHeight(context) * 0.6,
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                otpFieldStyle: OtpFieldStyle(enabledBorderColor: Colors.white,disabledBorderColor: AppColor.base),
                style: const TextStyle(fontSize: 17,color: Colors.white),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
          ),
          SizedBox(
            height: Utils.displayHeight(context) * 0.04,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                        radius: 13,
                        backgroundColor: Color.fromARGB(179, 1, 73, 124),
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.white70,
                        ))
                  ],
                ),
              ))
        ]),
      ),
    )));
  }
}
