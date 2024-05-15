import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/controller/home_provider.dart';
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
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).cityController.text =
        "calicut";
    Provider.of<HomeProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SearchCityWidget(
            onTap: Provider.of<HomeProvider>(context, listen: false).getData,
            cityController: Provider.of<HomeProvider>(context, listen: false)
                .cityController,
          )
        ],
        backgroundColor: whiteColor,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).getData(),
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

          return Consumer<HomeProvider>(builder: (context, weather, _) {
            return Container(
              width: size.width,
              height: size.height,
              color: whiteColor,
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopWidget(data: weather.data),
                    kheight18,
                    BottomWidget(data: weather.data)
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
