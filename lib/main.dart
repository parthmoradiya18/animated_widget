import 'dart:math';

import 'package:animated_widget/homepage.dart';
import 'package:animated_widget/sfl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  List icon = [

    AnimatedIcons.add_event,
    AnimatedIcons.arrow_menu,
    AnimatedIcons.close_menu,

    AnimatedIcons.ellipsis_search,
    AnimatedIcons.event_add,
    AnimatedIcons.home_menu,

    AnimatedIcons.list_view,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.menu_close,

    AnimatedIcons.menu_home,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
    
    AnimatedIcons.search_ellipsis,
    AnimatedIcons.view_list,
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Animated Widget In Flutter",
          style: TextStyle(
              color: Colors.teal,
              //  backgroundColor: Colors.grey,
              wordSpacing: 2.0,
              letterSpacing: 1.5,
              fontStyle: FontStyle.italic,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.dotted,
              fontFamily: 'Roboto',
              height: 1.5,
              shadows: [Shadow(color: Colors.black, offset: Offset(2, 2))],
              fontWeight: FontWeight.bold),
        ),
      ),
      bottomSheet: Container(
        height: 50,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(20),
        child: Wrap(
          children: [
            IconButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: const EdgeInsets.all(15),
                textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MyStatefulWidget();
                  },
                ));
              },
              icon: Icon(
                Icons.add_box_outlined,
                size: 45,
                color: Colors.pink,
              ),
            ),
            IconButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  padding: const EdgeInsets.all(15),
                  textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                icon: Icon(
                  Icons.home,
                  size: 45,
                  color: Colors.pink,
                )),
          ],
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12.0),
                gridDelegate: const
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                ),
                itemCount: icon.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      alignment: Alignment.center,
                      child: AnimatedIcon(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        textDirection: TextDirection.ltr,
                        icon: icon[index],
                        progress: animation,
                        size: 50.0,
                        semanticLabel: 'Show menu',
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
