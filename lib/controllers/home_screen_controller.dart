import 'dart:core';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_controller.g.dart';

@riverpod
class NetWorthController extends _$NetWorthController {
  @override
  double build() => 3660;

  // Currently unused
  // Create "mock" way to add funds to account?
  void changeNetWorth({required double newNetWorth}) {
    state = newNetWorth;
  }
}

@riverpod
class MileStoneController extends _$MileStoneController {
  @override
  int build() => 10000;
  // Used with the right arrow, remove later
  void incrementMileStone() {
    state = state + 10000;
  }
}
