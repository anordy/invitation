import 'package:flutter/material.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/Auth/splash_widget.dart';

class BottomButtons extends StatefulWidget {
  final int currentIndex;
  final int dataLength;
  final PageController controller;

  const BottomButtons(
      {Key ? key,required this.currentIndex, required this.dataLength,required this.controller})
      : super(key: key);

  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  _navigateToLoginPage() {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.currentIndex == widget.dataLength - 1
          ? [
              Expanded(
                child: ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 70.0,
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          _navigateToLoginPage();
                        },
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.1,
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap, // add this
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide.none),
                        child: Container(
                            child: const Text(
                          "Get started",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        )))),
              )
            ]
          : [
              MaterialButton(
                minWidth: 0.0,
                onPressed: () {
                  _navigateToLoginPage();
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1.3,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Row(
                children: [
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    minWidth: 0.0,
                    onPressed: () {
                      widget.controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16.0,
                          height: 1.3,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ))
                ],
              )
            ],
    );
  }
}
