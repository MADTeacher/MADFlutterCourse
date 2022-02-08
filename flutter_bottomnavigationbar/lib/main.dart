import 'dart:ui';

import 'package:flutter/material.dart';

// BottomNavigationBar({Key? key,
//                      required List<BottomNavigationBarItem> items,
//                      ValueChanged<int>? onTap,
//                      int currentIndex = 0,
//                      double? elevation,
//                      BottomNavigationBarType? type,
//                      Color? fixedColor,
//                      Color? backgroundColor,
//                      double iconSize = 24.0,
//                      Color? selectedItemColor,
//                      Color? unselectedItemColor,
//                      IconThemeData? selectedIconTheme,
//                      IconThemeData? unselectedIconTheme,
//                      double selectedFontSize = 14.0,
//                      double unselectedFontSize = 12.0,
//                      TextStyle? selectedLabelStyle,
//                      TextStyle? unselectedLabelStyle,
//                      bool? showSelectedLabels,
//                      bool? showUnselectedLabels,
//                      MouseCursor? mouseCursor,
//                      bool? enableFeedback,
//                      BottomNavigationBarLandscapeLayout? landscapeLayout,})

// BottomNavigationBarItem({required Widget icon,
//                         Widget? title, // @Deprecated 'Use "label"
//                         String? label,
//                         Widget? activeIcon,
//                         Color? backgroundColor,
//                         String? tooltip})
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  int _selectIndex = 0;
  late Widget _bodyWidget;

  @override
  void initState() {
    super.initState();
    onItemTepped(0);
  }

  void onItemTepped(int index) {
    setState(() {
      _selectIndex = index;
      _bodyWidget = _buildBodyWidget(index);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _bodyWidget = _buildBodyWidget(_selectIndex);
    });
  }

  Widget _buildBodyWidget(int widgetType) {
    switch (widgetType) {
      case 0:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        );
      case 1:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Button pushed times:',
              ),
              Text(
                '$_counter',
                style: const TextStyle(
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      default:
        throw ArgumentError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _bodyWidget,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Oo',
            activeIcon: Icon(Icons.access_alarm),
            tooltip: '(-_-)'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: '',
            tooltip: '^_^'
          ),
        ],
        elevation: 25,
        enableFeedback: false,
        iconSize: 40,
        backgroundColor: Colors.tealAccent,
        selectedItemColor: Colors.red[900],
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(
          color: Colors.indigoAccent,
          fontWeight: FontWeight.bold,
          fontSize: 29
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedFontSize: 50,
        unselectedItemColor: Colors.purpleAccent,
        selectedIconTheme: const IconThemeData(
          color: Colors.deepOrangeAccent,
          size: 30,
          opacity: 0.8
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.deepPurple,
          size: 10,
          opacity: 0.8
        ),
        mouseCursor: SystemMouseCursors.cell,
      ),
    );
  }
}
