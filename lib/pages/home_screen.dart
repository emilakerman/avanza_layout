import 'dart:math';
import 'package:avanza_app/constants/dividers.dart';
import 'package:avanza_app/controllers/home_screen_controller.dart';
import 'package:avanza_app/widgets/flutter_switch_widget.dart';
import 'package:avanza_app/widgets/gradient_widget.dart';
import 'package:avanza_app/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:avanza_app/constants/app_colors.dart';
import 'package:avanza_app/constants/app_paddings.dart';
import 'package:avanza_app/constants/app_sizes.dart';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                childWidget: Consumer(
                  builder: (_, ref, __) {
                    return _buildInnerTopContainer(
                      netWorth: ref.watch(netWorthControllerProvider),
                    );
                  },
                ),
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
                childWidget: Consumer(builder: (_, ref, __) {
                  return _buildInnerMileStoneContainer(
                    ref: ref,
                    netWorth: ref.read(netWorthControllerProvider),
                  );
                }),
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
        floatingActionButton: Consumer(builder: (_, ref, __) => _buildAddFundsButton(ref: ref)),
      ),
    );
  }

  Widget _buildInnerMileStoneContainer({required double netWorth, required WidgetRef ref}) {
    int mileStoneValue = ref.watch(mileStoneControllerProvider);
    ref.watch(netWorthControllerProvider);
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
              Row(
                children: [
                  _buildCommonText(text: mileStoneValue.toString(), fontSize: 24),
                  IconButton(
                    onPressed: () =>
                        ref.read(mileStoneControllerProvider.notifier).incrementMileStone(),
                    icon: const Icon(Icons.arrow_right, color: AppColors.darkGreen),
                  )
                ],
              ),
              AppSizes.smallVertical,
              Consumer(
                builder: (_, ref, __) => ProgressIndicatorExample(
                  netWorth: netWorth,
                  mileStone: mileStoneValue.toDouble(),
                ),
              ),
              AppSizes.smallVertical,
              _buildCommonText(text: "${mileStoneValue - netWorth.toInt()} kr kvar", fontSize: 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddFundsButton({required WidgetRef ref}) {
    return FloatingActionButton(
      onPressed: () => ref.read(netWorthControllerProvider.notifier).changeNetWorth(
            newNetWorth: Random().nextInt(5000).toDouble(),
          ),
      backgroundColor: AppColors.darkGreen,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildCommonText({
    required String text,
    double? fontSize,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color ?? AppColors.white),
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
              _buildCommonText(text: 'Totalt värde', color: AppColors.darkGreen, fontSize: 15),
              IconButton(
                icon: const Icon(Icons.fullscreen),
                color: AppColors.darkGreen,
                //TODO(Emil): Add functionality.
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              _buildCommonText(text: "$netWorth kr", fontSize: 22),
            ],
          ),
          AppSizes.mediumVertical,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FlutterSwitchWidget(),
              // This shows difference from last month, but is hardcoded for now.
              Consumer(
                builder: (_, ref, __) => _buildCommonText(
                  text: ref.watch(flutterSwitchControllerProvider) ? "-1037 kr" : "-11,05%",
                  color: AppColors.red,
                  fontSize: 18,
                ),
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
