import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/view/utils/colors.dart';
import 'package:weather_forecast/view/widgets/hourly_widget.dart';

class BottomWidget extends StatelessWidget {
  final Weather data;
  const BottomWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      height: size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forecasts",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              )
            ],
          ),
          Container(
            height: 8.0,
            //     padding: EdgeInsets.only(bottom: 20.0),
          ),
          SizedBox(
            height: 110.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount:
                  data.hourlyWeather == null ? 0 : data.hourlyWeather!.length,
              itemBuilder: (context, index) {
                final hourlyweather = data.hourlyWeather![index];
                final hourTime = hourlyweather.time!.split(" ").last;
                return HourlyWidget(
                    hourlyWeather: hourlyweather, time: hourTime);
              },
            ),
          )
        ],
      ),
    );
  }
}
