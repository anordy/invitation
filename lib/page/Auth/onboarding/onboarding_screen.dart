import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/onboarding/botton_buttons.dart';
import 'package:invitation/page/Auth/onboarding/explanation.dart';
import 'package:invitation/utils/colors.dart';

final List<ExplanationData> data = [
  ExplanationData(
      description:
          "Welcome aboard to the future of event invitations! Say goodbye to traditional paper cards.",
      title: "Welcome To D-Card",
      localImageSrc: "assets/icons/1.png",
      backgroundColor: AppColor.base),
  ExplanationData(
      description:
          "Easily access your cards by scanning QR codes. No more hassle with physical cards",
      title: "Scan QR Code",
      localImageSrc: "assets/icons/2.png",
      backgroundColor: AppColor.base),
  ExplanationData(
      description:
          "Verify your digital card by entering the code provided via SMS. Rest assured that your digital cards are protected.",
      title: "Verify OTP Code",
      localImageSrc: "assets/icons/3.png",
      backgroundColor: AppColor.base),
];

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState
    extends State<OnBoardingScreen> /*with ChangeNotifier*/ {
  final _controller = PageController();

  int _currentIndex = 0;

  // OpenPainter _painter = OpenPainter(3, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(top: 50,left: 20.0,right: 20.0,bottom: 20.0),
          decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [AppColor.prebase, AppColor.base],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //tileMode: TileMode.repeated,
      )),
          // color: data[_currentIndex].backgroundColor,
          alignment: Alignment.center,
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child:  Container(
                          alignment: Alignment.center,
                          child: PageView(
                              scrollDirection: Axis.horizontal,
                              controller: _controller,
                              onPageChanged: (value) {
                                // _painter.changeIndex(value);
                                setState(() {
                                  _currentIndex = value;
                                });
                                // notifyListeners();
                              },
                              children: data
                                  .map((e) => ExplanationPage(data: e))
                                  .toList())),
                      flex: 4),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(data.length,
                                    (index) => createCircle(index: index)),
                              )),
                          BottomButtons(
                            currentIndex: _currentIndex,
                            dataLength: data.length,
                            controller: _controller,
                          )
                        ],
                      ))
                ],
              ),
            )
          ]),
        );
  }

  createCircle({int ? index}) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.only(right: 4),
        height: 5,
        width: _currentIndex == index ? 15 : 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(3)));
  }
}
