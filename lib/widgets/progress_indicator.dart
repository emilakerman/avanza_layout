import 'package:avanza_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  final double netWorth;
  final double mileStone;

  const ProgressIndicatorExample({
    super.key,
    required this.netWorth,
    required this.mileStone,
  });

  @override
  State<ProgressIndicatorExample> createState() => _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: LinearProgressIndicator(
        color: AppColors.darkGreen,
        backgroundColor: AppColors.darkGreen.withOpacity(0.3),
        value: widget.netWorth / widget.mileStone,
      ),
    );
  }
}
