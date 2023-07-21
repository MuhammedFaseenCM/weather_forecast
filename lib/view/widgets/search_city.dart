import 'package:flutter/material.dart';
import 'package:weather_forecast/controller/home_provider.dart';
import 'package:weather_forecast/view/utils/colors.dart';

class SearchCityWidget extends StatelessWidget {
  final Function() onTap;
  final TextEditingController cityController;
  const SearchCityWidget({super.key, required this.onTap, required this.cityController});
  static HomeProvider homeProvider = HomeProvider();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
          controller:cityController,
          style: const TextStyle(color: tertiaryColor),
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.location_on,
                color: tertiaryColor,
              ),
              border: OutlineInputBorder(),
              hintText: "Location"),
          onTap: onTap),
    );
  }
}
