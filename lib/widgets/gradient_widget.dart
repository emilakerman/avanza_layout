import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gradient_line_graph/gradient_line_graph.dart';

class GradientWidget extends StatefulWidget {
  const GradientWidget({super.key});

  @override
  State<GradientWidget> createState() => _GradientWidgetState();
}

class _GradientWidgetState extends State<GradientWidget> {
  double downloadRate = 0;
  double downloadProgress = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      download();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientLineGraphView(
      min: 0,
      max: 150,
      value: downloadRate,
      precentage: downloadProgress,
      color: const Color(0xFF4cbdbb).withOpacity(0.7),
      duration: const Duration(milliseconds: 0),
    );
  }

  Future download() async {
    setState(() {
      downloadProgress = 0;
      downloadRate = 40;
    });

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (downloadProgress >= 90) {
        timer.cancel();
      }

      double generated = generateRandom(min: 30, max: 80).toDouble();
      goToDownloadValue(value: generated);
    });
  }

  void goToDownloadValue({required double value}) {
    double valueToAdd = (value - downloadRate) / 10;
    int counter = 0;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (counter == 9 || downloadRate == value) {
        timer.cancel();
      }

      counter++;
      setState(() {
        downloadRate += valueToAdd;
        downloadProgress += 0.5;
      });
    });
  }

  int generateRandom({required int min, required int max}) {
    final random = Random();
    return min + random.nextInt(max - min);
  }
}
