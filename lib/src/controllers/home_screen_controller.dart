import 'dart:core';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_controller.g.dart';

@riverpod
class NetWorthController extends _$NetWorthController {
  @override
  double build() => 3660;

  // Used currently to randomize networth for testing purposes.
  void changeNetWorth({required double newNetWorth}) {
    state = newNetWorth;
  }
}

@riverpod
class MileStoneController extends _$MileStoneController {
  // This milestone state should increase to 20K when networth >= 10K, etc.
  @override
  int build() => 10000;
  // Used with the right arrow for testing, remove later.
  void incrementMileStone() {
    state = state + 10000;
  }
}

@riverpod
class FlutterSwitchController extends _$FlutterSwitchController {
  @override
  bool build() => false;

  void reverseState() => state = !state;
}
