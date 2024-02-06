import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invitation/cubits/event/cubit/event_cubit.dart';
import 'package:invitation/cubits/event_scan/cubit/event_scan_cubit.dart';
import 'package:invitation/page/Auth/onboarding/onboarding_screen.dart';
import 'package:invitation/widget/custom_snackbar.dart';
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
              padding: const EdgeInsets.only(top: 30.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white70,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: Text("Enter OTP Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(
              height: 20.0,
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
            const SizedBox(
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: CustomSnackBarContent(
                          code: result.code,
                          errorText: result.message,
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                    },
                    failure: (errorMessage) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: CustomSnackBarContent(
                          code: 500,
                          errorText: errorMessage,
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                    },
                    orElse: () {});
              },
            ),
          ],
        ),
      )),
    );
  }
}
