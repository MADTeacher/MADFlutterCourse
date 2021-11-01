import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// FloatingActionButton({Key? key,
//                       Widget? child,
//                       String? tooltip,
//                       Color? foregroundColor,
//                       Color? backgroundColor,
//                       Color? focusColor,
//                       Color? hoverColor,
//                       Color? splashColor,
//                       Object? heroTag,
//                       double? elevation,
//                       double? focusElevation,
//                       double? hoverElevation,
//                       double? highlightElevation,
//                       double? disabledElevation,
//                       required VoidCallback? onPressed,
//                       MouseCursor? mouseCursor,
//                       bool mini,
//                       ShapeBorder? shape,
//                       Clip clipBehavior,
//                       FocusNode? focusNode,
//                       bool autofocus,
//                       MaterialTapTargetSize? materialTapTargetSize,
//                       bool isExtended,
//                       bool? enableFeedback})
//FloatingActionButton.extended
//FloatingActionButton.large
//FloatingActionButton.small

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {},
                //mini: true,
              ),
              FloatingActionButton.large(
                onPressed: () {},
                autofocus: true, // web
                focusColor: Colors.teal, // web
                focusElevation: 130, // web
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.limeAccent,
                clipBehavior: Clip.hardEdge,
                enableFeedback: false,
                heroTag: null,
                child: FloatingActionButton(
                  onPressed: () {},
                  mini: true,
                  isExtended: true,
                  child: const Icon(Icons.monetization_on_rounded),
                  foregroundColor: Colors.limeAccent,
                ),
                highlightElevation: 200,
                hoverColor: Colors.teal, // web
                hoverElevation: 130, // web
                tooltip: 'Уииииииииии!!!',
                splashColor: Colors.black,
                // shape: const OutlineInputBorder(),
                // shape: const RoundedRectangleBorder(),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(90)),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                child: const Icon(Icons.disc_full_rounded),
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('Тык!!!'),
                icon: const Icon(Icons.sd_card),
                elevation: 20,
                disabledElevation: 50,
                focusColor: Colors.teal, // web
                focusElevation: 130, // web
                // only FloatingActionButton.extended
                extendedIconLabelSpacing: 20,
                extendedPadding: const EdgeInsets.all(10),
                extendedTextStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ))),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
