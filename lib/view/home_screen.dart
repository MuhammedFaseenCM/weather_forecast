import 'package:flutter/material.dart';
import 'package:weather_forecast/controller/home_provider.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/view/utils/colors.dart';
import 'package:weather_forecast/view/widgets/additional.dart';
import 'package:weather_forecast/view/widgets/bottom_widget.dart';
import 'package:weather_forecast/view/widgets/search_city.dart';
import 'package:weather_forecast/view/widgets/top_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeProvider homeProvider = HomeProvider();
  Weather data = Weather();
  @override
  void initState() {
    homeProvider.cityController.text = "calicut";
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SearchCityWidget(
            onTap: () => getData(),
            cityController: homeProvider.cityController,
          )
        ],
        backgroundColor: whiteColor,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            width: size.width,
            height: size.height,
            color: whiteColor,
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopWidget(data: data),
                kheight18,
                BottomWidget(data: data)
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> getData() async {
    if (homeProvider.cityController.text.isNotEmpty) {
      data =
          await fetchWatherData(searchText: homeProvider.cityController.text);
    } else {
      data = await fetchWatherData(searchText: "calicut");
    }
  }
}
