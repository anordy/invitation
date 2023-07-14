import 'package:flutter/material.dart';

class ExplanationData {
  final String title;
  final String description;
  final String localImageSrc;
  final Color backgroundColor;

  ExplanationData(
      {required this.title, required this.description, required this.localImageSrc, required this.backgroundColor});
}

class ExplanationPage extends StatelessWidget {
  final ExplanationData data;

  const ExplanationPage({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 24, bottom: 16),
            child: Image.asset(data.localImageSrc),
                height: MediaQuery.of(context).size.height * 0.33,
                alignment: Alignment.center),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title,
                style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    data.description,
                    style: const TextStyle(fontSize: 16.0, height: 1.3, color: Colors.white, fontWeight: FontWeight.w200),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
