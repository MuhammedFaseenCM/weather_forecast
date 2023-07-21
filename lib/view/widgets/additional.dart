import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final String wind;
  final String humidity;
  final String pressure;
  final String feelsLike;

  const AdditionalInfo(
      {super.key,
      required this.wind,
      required this.humidity,
      required this.pressure,
      required this.feelsLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("wind", style: titleFont),
                  kheight18,
                  Text("humidity", style: titleFont)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

SizedBox kheight18 =const SizedBox(
  height: 18.0,
);
