import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// const Scaffold({
//     Key? key,
//     this.appBar,
//     this.body,
//     this.floatingActionButton,
//     this.floatingActionButtonLocation,
//     this.floatingActionButtonAnimator,
//     this.persistentFooterButtons,
//     this.drawer,
//     this.onDrawerChanged,
//     this.endDrawer,
//     this.onEndDrawerChanged,
//     this.bottomNavigationBar,
//     this.bottomSheet,
//     this.backgroundColor,
//     this.resizeToAvoidBottomInset,
//     this.primary = true,
//     this.drawerDragStartBehavior = DragStartBehavior.start,
//     this.extendBody = false,
//     this.extendBodyBehindAppBar = false,
//     this.drawerScrimColor,
//     this.drawerEdgeDragWidth,
//     this.drawerEnableOpenDragGesture = true,
//     this.endDrawerEnableOpenDragGesture = true,
//     this.restorationId,
//   })

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  String _drawerState = 'Close';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Some page',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void changedDrawerState(bool state) {
    setState(() {
      _drawerState = state ? 'Open' : 'Close';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),

      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Drawer state: $_drawerState'),
        _widgetOptions.elementAt(_selectedIndex),
      ])),

      floatingActionButton: const MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      drawer: const SizedBox(
        child: Drawer(),
        width: 200,
      ),
      endDrawer: const Drawer(),
      drawerDragStartBehavior: DragStartBehavior.down,
      onDrawerChanged: changedDrawerState,
      drawerScrimColor: Colors.cyan[200],
      drawerEdgeDragWidth: 200,

      backgroundColor: Colors.amber[200],

      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Уииии!!!')));
                },
                icon: const Icon(Icons.mood_sharp)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.mood_bad)),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SizedBox(
                          height: 300,
                          child: Text('Уииии!!!'),
                        );
                      });
                },
                icon: const Icon(Icons.money_off))
          ],
        )
      ],

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.gps_fixed), label: 'Some Page'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
      ),
      // bottomSheet: SizedBox(height: 80,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: const [
      //       Text('Уииии!!!'),
      //       Icon(Icons.mood_bad)
      //     ],
      //   ),
      // ),

      extendBody: true,
      extendBodyBehindAppBar: true,
      primary: false,
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
            return Container(
              height: 100,
              color: Colors.lightGreen,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Му-ха-ха-ха!!!'),
                    ElevatedButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
