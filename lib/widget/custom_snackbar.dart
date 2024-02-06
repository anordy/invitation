import 'package:flutter/material.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent(
      {super.key, required this.code, required this.errorText});

  final String errorText;
  final int code;

  @override
  Widget build(BuildContext context) {
    IconData icon = code == 200 ? Icons.done : Icons.close;
    Color bgColor = code == 200 ? Color(0xFF397D54) : Color(0xFFC72C41);
    Color bgIconColor = code == 200 ? Color(0xFF235D3A) : Color(0xFF801336);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hi there!",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      errorText,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(20.0)),
              child: Image.asset(
                "assets/images/bubble.png",
                height: 48,
                width: 40,
                color: bgIconColor,
              )),
        ),
        Positioned(
            top: -10,
            left: 0,
            child: CircleAvatar(
              backgroundColor: bgIconColor,
              radius: 20,
              child: IconButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  )),
            ))
      ],
    );
  }
}
