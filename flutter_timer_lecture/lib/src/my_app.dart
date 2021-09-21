import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc_widget/bloc_timer_page.dart';
import 'getx_widget/getx_timer_page.dart';
import 'stateful_widget/state_timer_page.dart';

const waitTime = 5;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Timer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  late Widget _bodyWidget;

  // static List<Widget> listTimerWidget = <Widget>[
  //   const StateTimerPage(waitTimeInSec: waitTime),
  //   const BLoCTimerPage(waitTimeInSec: waitTime),
  //   GetXTimerPage(
  //     waitTimeInSec: waitTime,
  //   )
  // ];
  @override
  void initState() {
    super.initState();
    onItemTepped(selectedIndex);
  }

  Widget _buildCurrentWidget(int type) {
    switch (type) {
      case 0:
        return const StateTimerPage(waitTimeInSec: waitTime);
      case 1:
        return const BLoCTimerPage(waitTimeInSec: waitTime);
      case 2:
        return GetXTimerPage(waitTimeInSec: waitTime);
      default:
        throw ArgumentError();
    }
  }

  void onItemTepped(int index) {
    setState(() {
      selectedIndex = index;
      _bodyWidget = _buildCurrentWidget(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.youtube_searched_for), label: 'Stateful'),
          BottomNavigationBarItem(icon: Icon(Icons.tab_rounded), label: 'BLoC'),
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: 'GetX'),
        ],
      ),
    );
  }
}
