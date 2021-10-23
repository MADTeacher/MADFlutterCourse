import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

// AppBar({Key? key,
//         Widget? leading,
//         bool automaticallyImplyLeading,
//         Widget? title,
//         List<Widget>? actions,
//         Widget? flexibleSpace,
//         PreferredSizeWidget? bottom,
//         double? elevation,
//         Color? shadowColor,
//         ShapeBorder? shape,
//         Color? backgroundColor,
//         Color? foregroundColor,
//         @Deprecated(' after v2.4.0-0.0.pre.')        //
//         Brightness? brightness,
//         IconThemeData? iconTheme,
//         IconThemeData? actionsIconTheme,
//         @Deprecated(' after v2.4.0-0.0.pre.')        //
//         TextTheme? textTheme,
//         bool primary,
//         bool? centerTitle,
//         bool excludeHeaderSemantics,
//         double? titleSpacing,
//         double toolbarOpacity,
//         double bottomOpacity,
//         double? toolbarHeight,
//         double? leadingWidth,
//         @Deprecated('after v2.4.0-0.0.pre.')        //
//         bool? backwardsCompatibility,
//         TextStyle? toolbarTextStyle,
//         TextStyle? titleTextStyle,
//         SystemUiOverlayStyle? systemOverlayStyle})

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                log('Тык!!!');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPage()));
              },
              child: const Text(
                'Тык!!!',
                style: TextStyle(color: Colors.black87),
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sailing))
        ],
        actionsIconTheme: const IconThemeData(color: Colors.blue, opacity: 0.7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Тык!!!'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.save))
          ],
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        titleSpacing: 0,

        //automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.delete_sweep_rounded)),
        leadingWidth: 56,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.indigo,

        // primary: false,

        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: const [
        //     Tab(icon: Icon(Icons.home),),
        //     Tab(icon: Icon(Icons.gpp_maybe_outlined,))
        //   ],
        // ),

        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(50),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Text('O_o'),
        //       IconButton(onPressed: () {}, icon: const Icon(Icons.gps_fixed))
        //     ],
        //   ),
        // ),
        // bottomOpacity: 0.9,

        elevation: 20,
        shadowColor: Colors.blueGrey,
        excludeHeaderSemantics: true,
        toolbarHeight: 150,
        // flexibleSpace: FlexibleSpaceBar(
        //   // title: const Text('O_o'),
        //   // centerTitle: true,
        //   background: Center(
        //     child: Image.asset(
        //       'assets/image.jpeg',
        //       width: MediaQuery.of(context).size.width,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // toolbarOpacity: 1,
        // toolbarTextStyle: const TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //     fontStyle: FontStyle.italic),

        shape: ShapeBorder.lerp(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(190),
            )),
            null,
            0),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: const Center(),
      drawer: const Drawer(),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
