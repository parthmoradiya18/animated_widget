import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;
  bool selected1 = false;
  bool selected2 = false;
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },


            child: Center(
                child: AnimatedCrossFade(
                  alignment: Alignment.center,
                  excludeBottomFocus: true,
                  firstCurve: Curves.linear,
                  reverseDuration: Duration(seconds: 2),
                 secondCurve: Curves.linear,
                sizeCurve: Curves.linear,

                  duration: const Duration(seconds: 3),
                  firstChild: Container(
                    height: 180,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green
                    ),
                    alignment: Alignment.center,
                    child: const Text("India",
                      style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold),),
                  ),
                  secondChild:  Container(
                      height: 200,
                      width: 300,
                      color: Colors.teal,
                      alignment: Alignment.center,
                      child: const Text("Parth Patel",
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold),)
                  ),
                  crossFadeState: selected ?
                  CrossFadeState.showFirst :
                  CrossFadeState.showSecond,
                )
            ),
          ),
          Container(margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedCrossFade(
                  duration: Duration(seconds: 1),
                  firstChild: Container(
                    width: 200,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Parth',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  secondChild: Container(
                    width: 200,
                    height: 100,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Patel',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  crossFadeState: _showFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),

                TextButton(  style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  padding: const EdgeInsets.all(15),
                  textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                ),
                    onPressed: () {
                      _showFirst = !_showFirst;
                      setState(() {});
                    },
                    child: Text("ok",style: TextStyle(fontSize: 50,color: Colors.black),)),
              ],
            ),
          ),
          
          GestureDetector(
            onTap: () {
              setState(() {
                selected1 = !selected1;
              });
            },
            child: Center(
              child: AnimatedContainer(
                margin: EdgeInsets.all(10),
                transformAlignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected1 ? Colors.blue : Colors.red,
                ),
                padding: EdgeInsets.all(20),
                width: selected1 ? 200.0 : 100.0,
                height: selected1 ? 80.0 : 160.0,
                alignment: selected1
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Icon(
                  Icons.grade_outlined,
                  size: 20,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected2 = !selected2;
              });
            },
            child: Center(
              child: AnimatedContainer(
                margin: EdgeInsets.all(10),
                transformAlignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected2 ? Colors.yellow : Colors.orange,
                ),
                padding: EdgeInsets.all(20),
                width: selected2 ? 200.0 : 100.0,
                height: selected2 ? 80.0 : 160.0,
                alignment: selected2
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Icon(
                  Icons.sunny,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
