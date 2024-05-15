import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/controller/home_provider.dart';
import 'package:weather_forecast/view/utils/colors.dart';

class SearchCityWidget extends StatelessWidget {
  final Function() onTap;
  final TextEditingController cityController;
  const SearchCityWidget(
      {super.key, required this.onTap, required this.cityController});
  static HomeProvider homeProvider = HomeProvider();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: TextFormField(
          controller: cityController,
          style: const TextStyle(color: tertiaryColor),
          decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap:
                    Provider.of<HomeProvider>(context, listen: false).getData,
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: primaryColor,
                  size: 30,
                ),
              ),
              prefixIcon: const Icon(
                Icons.location_on,
                color: primaryColor,
              ),
              labelText: "Location",
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(16.0)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor, width: 3),
                  borderRadius: BorderRadius.circular(16.0)),
              hintText: "Enter your location"),
          onTap: Provider.of<HomeProvider>(context, listen: false).getData,
          onTapOutside: (_) =>
              Provider.of<HomeProvider>(context, listen: false).getData(),
        ),
      ),
    );
  }
}
