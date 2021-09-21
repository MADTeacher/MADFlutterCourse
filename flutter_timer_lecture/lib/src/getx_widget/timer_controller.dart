import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  Timer? _timer;
  final int waitTimeInSec;
  late int _currentWaitTimeInSec;
  var percent = 1.0.obs;
  var timeStr = '05:00'.obs;
  var isRun = false.obs;

  TimerController(this.waitTimeInSec) {
    _currentWaitTimeInSec = waitTimeInSec;
    _calculationTime();
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
        _currentWaitTimeInSec -= 1;
        _calculationTime();
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
    _currentWaitTimeInSec = waitTimeInSec;
    _calculationTime();
  }

  void pause() {
    _timer?.cancel();
    isRun.value = false;
  }

  void _calculationTime() {
    var minuteStr = (_currentWaitTimeInSec ~/ 60).toString().padLeft(2, '0');
    var secondStr = (_currentWaitTimeInSec % 60).toString().padLeft(2, '0');
    percent.value = _currentWaitTimeInSec / waitTimeInSec;
    timeStr.value = '$minuteStr:$secondStr';
  }
}
