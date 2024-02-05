import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invitation/cubits/event/cubit/event_cubit.dart';
import 'package:invitation/cubits/event_scan/cubit/event_scan_cubit.dart';
import 'package:invitation/page/Auth/onboarding/onboarding_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_field.dart' as otp;
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
  otp.OtpFieldController otpController = otp.OtpFieldController();
  String? globalPin;
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
              child:
              BlocBuilder<EventCubit, EventState>(
                bloc: EventCubit()..fetchEvent(this.widget.id),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Container(
                          height: Utils.displayHeight(context) * 0.05,
                          child: Loader());
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
                            "Something went wrong",
                            style: TextStyle(
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
            otp.OTPTextField(
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
                  print(pin);
                },
                onCompleted: (pin) {
                  globalPin = pin;
                }),

            SizedBox(
              height: 50,
            ),

            BlocConsumer<EventScanCubit, EventScanState>(
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return Loader(
                    size: 50,
                  );
                }, orElse: () {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        height: 50,
                        minWidth: Utils.displayWidth(context) * 0.9,
                        color: const Color.fromARGB(179, 2, 37, 62),
                        onPressed: () async {
                          final data = {
                            "pin": globalPin,
                            "event_id": this.widget.id,
                          };
                          print(data);
                          BlocProvider.of<EventScanCubit>(context)
                              .scanCard(data);
                          otpController.clear();
                        },
                        child: Text(
                          "VERIFY".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 16),
                        ),
                      ));
                });
              },
              listener: (context, state) {
                state.maybeWhen(
                    success: (result) {
                      showCustomDialogBasedOnCode(result.code, result.message);
                    },
                    failure: (errorMessage) {
                      showCustomDialogBasedOnCode(500, errorMessage);
                    },
                    orElse: () {});
              },
            ),
          ],
        ),
      )),
    );
  }

  void showCustomDialogBasedOnCode(int code, String message) {
    IconData icon = code == 200 ? Icons.done : Icons.close;
    Color bgColor = code == 200 ? Colors.green : Colors.red;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bgColor,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            height: 100,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 15),
                SizedBox(height: 10),
                Text(message, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}
