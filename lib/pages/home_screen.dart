import 'package:avanza_app/constants/dividers.dart';
import 'package:avanza_app/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:avanza_app/constants/app_colors.dart';
import 'package:avanza_app/constants/app_paddings.dart';
import 'package:avanza_app/constants/app_sizes.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double netWorth = 3762;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Min ekonomi"),
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuText(text: "Översikt"),
                  _buildMenuText(text: "Innehav"),
                  _buildMenuText(text: "Ordrar"),
                  _buildMenuText(text: "Transaktioner"),
                ],
              ),
              AppSizes.largeVertical,
              _buildContainer(
                screenWidth: screenSize.width,
                height: 150,
                childWidget: _buildInnerTopContainer(netWorth: netWorth),
              ),
              AppSizes.largeVertical,
              _buildContainer(
                screenWidth: screenSize.width,
                height: 200,
                childWidget: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPaddings.smallPadding,
                    right: AppPaddings.smallPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sparande",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("1230 kr", style: TextStyle(color: AppColors.white)),
                              Text("Utv i år -11.05%", style: TextStyle(color: AppColors.white)),
                            ],
                          )
                        ],
                      ),
                      Dividers.whiteDivider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _buildIconWithText(
                                color: Colors.blue,
                                text: "AF",
                                icon: Icons.circle,
                                size: 35,
                              ),
                              AppSizes.smallHorizontal,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("423012", style: TextStyle(color: AppColors.white)),
                                  Text("Tillg. för köp 0 kr",
                                      style: TextStyle(color: AppColors.white)),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              _buildCommonText(text: "0 kr"),
                              _buildCommonText(text: "0.0%"),
                            ],
                          )
                        ],
                      ),
                      Dividers.whiteDivider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _buildIconWithText(
                                color: Colors.red,
                                text: "ISK",
                                icon: Icons.circle,
                                size: 35,
                              ),
                              AppSizes.smallHorizontal,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildCommonText(text: "423019 kr"),
                                  _buildCommonText(text: "Tillg. för köp 84 kr"),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              _buildCommonText(text: "9301 kr"),
                              _buildCommonText(text: "-11.05%"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppSizes.largeVertical,
              _buildContainer(
                screenWidth: screenSize.width,
                height: 150,
                childWidget: _buildInnerMileStoneContainer(netWorth: netWorth),
              ),
              AppSizes.largeVertical,
              _buildContainer(
                screenWidth: screenSize.width,
                height: 150,
                // childWidget: const GradientWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInnerMileStoneContainer({required double netWorth}) {
    const int mileStoneValue = 10000;

    String convertToAbbrevation({required int value}) {
      return NumberFormat.compact().format(value);
    }

    return Row(
      children: [
        _buildIconWithText(
          color: AppColors.darkGreen,
          text: convertToAbbrevation(value: mileStoneValue),
          icon: Icons.circle_notifications,
          size: 90,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCommonText(text: "Nästa milstolpe", fontSize: 18),
              _buildCommonText(text: mileStoneValue.toString(), fontSize: 24),
              const SizedBox(height: 10),
              ProgressIndicatorExample(
                netWorth: netWorth,
              ),
              const SizedBox(height: 10),
              _buildCommonText(text: "${mileStoneValue - netWorth.toInt()} kr kvar", fontSize: 15),
            ],
          ),
        ),
      ],
    );
  }

  Text _buildCommonText({
    required String text,
    double? fontSize,
  }) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: AppColors.white),
    );
  }

  Widget _buildIconWithText({
    required Color color,
    required String text,
    required IconData icon,
    required double size,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          icon,
          size: size,
          color: color,
        ),
        Text(
          text,
          style: const TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildInnerTopContainer({required double? netWorth}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPaddings.smallPadding,
        right: AppPaddings.smallPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Totalt värde",
                style: TextStyle(color: AppColors.white),
              ),
              IconButton(
                icon: const Icon(Icons.fullscreen),
                color: AppColors.white,
                //TODO(Emil): Add functionality.
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "$netWorth kr",
                style: const TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContainer({
    required double screenWidth,
    required double height,
    Widget? childWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPaddings.smallPadding,
        right: AppPaddings.smallPadding,
      ),
      child: Container(
        width: screenWidth,
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.primaryRounded),
          ),
        ),
        child: childWidget,
      ),
    );
  }

  Widget _buildMenuText({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: AppColors.white),
    );
  }
}