import 'package:avanza_app/constants/dividers.dart';
import 'package:avanza_app/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:avanza_app/constants/app_colors.dart';
import 'package:avanza_app/constants/app_paddings.dart';
import 'package:avanza_app/constants/app_sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double netWorth = 9500;
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
                              _buildIconWithText(color: Colors.blue, text: "AF"),
                              AppSizes.smallHorizontal,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "423012",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                  Text(
                                    "Tillg. för köp 0 kr",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text("0 kr", style: TextStyle(color: AppColors.white)),
                              Text("0.0%", style: TextStyle(color: AppColors.white)),
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
                              _buildIconWithText(color: Colors.red, text: "ISK"),
                              AppSizes.smallHorizontal,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "423019",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                  Text(
                                    "Tillg. för köp 84 kr",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text("9301 kr", style: TextStyle(color: AppColors.white)),
                              Text("-11.05%", style: TextStyle(color: AppColors.white)),
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
                childWidget: ProgressIndicatorExample(
                  netWorth: netWorth,
                ),
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

  Widget _buildIconWithText({required Color color, required String text}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.circle,
          size: 35,
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

  Widget _buildProgressBar() {
    return LinearProgressIndicator();
  }
}
