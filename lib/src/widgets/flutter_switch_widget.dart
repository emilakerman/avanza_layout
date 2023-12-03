import 'package:avanza_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlutterSwitchWidget extends ConsumerWidget {
  const FlutterSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterSwitch(
      showOnOff: true,
      value: ref.watch(flutterSwitchControllerProvider) ?? false,
      activeIcon: _buildText(text: "kr"),
      activeText: "%",
      inactiveIcon: _buildText(text: "%"),
      inactiveText: 'kr',
      inactiveColor: AppColors.secondary,
      toggleColor: AppColors.darkGreen.withOpacity(0.5),
      inactiveTextColor: AppColors.white,
      activeTextColor: AppColors.white,
      activeColor: AppColors.secondary,
      activeTextFontWeight: FontWeight.bold,
      inactiveTextFontWeight: FontWeight.bold,
      switchBorder: Border.all(color: AppColors.darkGreen),
      onToggle: (val) {
        ref.read(flutterSwitchControllerProvider.notifier).reverseState();
      },
    );
  }

  Text _buildText({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: AppColors.white),
    );
  }
}
