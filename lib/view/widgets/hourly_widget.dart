import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/model/hourly_weather_model.dart';
import 'package:weather_forecast/view/utils/colors.dart';

class HourlyWidget extends StatelessWidget {
  final HourlyWeather hourlyWeather;
  final String time;
  const HourlyWidget(
      {super.key, required this.hourlyWeather, required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      margin: const EdgeInsets.only(right: 20.0, bottom: 10.0),
      width: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.6),
              spreadRadius: 2.0,
              blurRadius: 2.0,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: const LinearGradient(
              colors: [firstGradientColor, secondGradientColor])),
      child: Column(
        children: [
          Text(
            time,
            style: const TextStyle(
                fontSize: 17.0, color: whiteColor, fontWeight: FontWeight.bold),
          ),
          hourlyWeather.isHourDay == 1
              ? Image.asset(
                  "assets/weather/02d.png",
                  width: 20.0,
                )
              : Image.asset(
                  "assets/weather/02n.png",
                  width: 20.0,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hourlyWeather.temp!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: whiteColor),
              ),
              const Text(
                "°",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                    color: whiteColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
