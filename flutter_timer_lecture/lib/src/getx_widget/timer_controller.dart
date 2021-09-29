import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  Timer? _timer;
  final int waitTimeInSec;
  late Rx<int> _currentWaitTimeInSec;
  var isRun = false.obs;

  TimerController(this.waitTimeInSec) {
    _currentWaitTimeInSec = Rx<int>(waitTimeInSec);
  }

  @override
  void onClose() {
    pause();
    super.onClose();
  }

  void start() {
    if (_currentWaitTimeInSec > 0) {
      isRun.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _currentWaitTimeInSec.value -= 1;
        if (_currentWaitTimeInSec <= 0) {
          pause();
          Get.showSnackbar(GetBar(
            backgroundColor: Colors.grey[900]!,
            message: 'Finish',
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.only(bottom: 50),
          ));
        }
      });
    }
  }

  void restart() {
    _currentWaitTimeInSec.value = waitTimeInSec;
  }

  void pause() {
    _timer?.cancel();
    isRun.value = false;
  }

  String get timeStr {
    var minuteStr =
        (_currentWaitTimeInSec.value ~/ 60).toString().padLeft(2, '0');
    var secondStr =
        (_currentWaitTimeInSec.value % 60).toString().padLeft(2, '0');
    return '$minuteStr:$secondStr';
  }

  double get percent => _currentWaitTimeInSec.value / waitTimeInSec;
}
