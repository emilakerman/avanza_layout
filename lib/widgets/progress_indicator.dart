import 'package:avanza_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  final double netWorth;

  const ProgressIndicatorExample({
    super.key,
    required this.netWorth,
  });

  @override
  State<ProgressIndicatorExample> createState() => _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Nästa milstolpe\n10 000',
            style: TextStyle(fontSize: 20, color: AppColors.white),
          ),
          const SizedBox(height: 30),
          LinearProgressIndicator(
            color: AppColors.darkGreen,
            backgroundColor: AppColors.primary,
            value: widget.netWorth / 10000,
          ),
        ],
      ),
    );
  }
}
