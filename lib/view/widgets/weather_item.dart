import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  final num? value;
  final String unit;
  final String imageUrl;
  const WeatherItem(
      {super.key,
      required this.value,
      required this.unit,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0)),
          child: Image.asset(imageUrl),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          value.toString() + unit,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
