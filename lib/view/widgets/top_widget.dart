import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/view/utils/colors.dart';
import 'package:weather_forecast/view/widgets/weather_item.dart';

class TopWidget extends StatelessWidget {
  final Weather data;
  const TopWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.6),
              spreadRadius: 5.0,
              blurRadius: 10.0,
              offset: const Offset(0, 3),
            ),
          ]),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: tertiaryColor,
              ),
              Text(
                data.cityName ?? "Enter a valid city",
                style: const TextStyle(
                    color: tertiaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            //  child: Image.asset("name"),
          ),
          SizedBox(
              height: 160.0,
              child: data.isDay == 1
                  ? Image.asset("assets/weather/01d.png")
                  : Image.asset("assets/weather/01n.png")),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  '${data.temp ?? 0.0}',
                  style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = shader),
                ),
              ),
              Text(
                "o",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = shader),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Feels like : ",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: tertiaryColor),
              ),
              Text(
                "${data.feelsLike ?? 0.0}°",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = shader),
              )
            ],
          ),
          Text(
            data.condition ?? "",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = shader),
          ),
          Text(
            DateFormat('HH:mm').format(DateTime.now()),
            style: const TextStyle(color: tertiaryColor),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Divider(
              color: tertiaryColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherItem(
                    value: data.wind ?? 0.0,
                    unit: "km/h",
                    imageUrl: "assets/icons/windspeed.png"),
                WeatherItem(
                    value: data.humidity ?? 0.0,
                    unit: "km/h",
                    imageUrl: "assets/icons/humidity.png"),
                WeatherItem(
                    value: data.pressure ?? 0.0,
                    unit: "km/h",
                    imageUrl: "assets/icons/clouds.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}
