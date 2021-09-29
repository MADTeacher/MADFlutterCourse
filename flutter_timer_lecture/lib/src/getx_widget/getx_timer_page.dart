import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'timer_controller.dart';

class GetXTimerPage extends StatelessWidget {
  final int waitTimeInSec;
  late final TimerController controller;

  GetXTimerPage({Key? key, required this.waitTimeInSec}) : super(key: key) {
    controller = TimerController(waitTimeInSec);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                  margin: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.restart();
                    },
                    child: const Icon(Icons.restart_alt),
                  )),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: size.height * 0.1,
                      width: size.height * 0.1,
                      margin: const EdgeInsets.all(10),
                      child: CircularProgressIndicator(
                        value: controller.percent,
                        backgroundColor: Colors.red[800],
                        strokeWidth: 8,
                      )),
                  Positioned(
                      child: Text(
                    controller.timeStr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              Container(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                  margin: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.isRun.value
                          ? controller.pause()
                          : controller.start();
                    },
                    child: controller.isRun.value
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                  )),
            ],
          )),
    );
  }
}
