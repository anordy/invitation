import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation/cubits/event/cubit/event_cubit.dart';
import 'package:invitation/cubits/event_scan/cubit/event_scan_cubit.dart';
import 'package:invitation/page/Auth/onboarding/onboarding_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class VerifyCardScan extends StatefulWidget {
  final String id;
  const VerifyCardScan({super.key, required this.id});

  @override
  _VerifyCardScanState createState() => _VerifyCardScanState();
}

class _VerifyCardScanState extends State<VerifyCardScan> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: Utils.displayHeight(context),
        width: Utils.displayWidth(context),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [AppColor.prebase, AppColor.base],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //tileMode: TileMode.repeated,
        )),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: BlocBuilder<EventCubit, EventState>(
                bloc: EventCubit()..fetchEvent(this.widget.id),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Container(
                          height: Utils.displayHeight(context) * 0.05,
                          child: const Text(
                            "No Title available",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                      ;
                    },
                    success: (event) {
                      return Container(
                        height: Utils.displayHeight(context) * 0.05,
                        child: Text(
                          event.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                    failure: (errorMessage) {
                      print(errorMessage);
                      return Container(
                          height: Utils.displayHeight(context) * 0.05,
                          child: const Text(
                            "No Title available",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "300",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "All",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "50",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "Active",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "50",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "InActive",
                      style: TextStyle(color: Colors.white38, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                otpFieldStyle: OtpFieldStyle(
                    enabledBorderColor: Colors.white,
                    disabledBorderColor: AppColor.base),
                style: const TextStyle(fontSize: 17, color: Colors.white),
                onChanged: (pin) {
                  print("*****************************");
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("*****************************");
                  print("Completed: " + pin);
                  final data = {
                    "pin": pin,
                    "event_id": this.widget.id,
                  };
                  // _eventProvider.checkCard(pin: pin, eventId: this.widget.id);
                  BlocProvider.of<EventScanCubit>(context).scanCard(data);
                  otpController.clear();
                }),
          ],
        ),
      )),
    );
  }
}
