
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

HandSignatureControl control = HandSignatureControl(
  threshold: 0.01,
  smoothRatio: 0.65,
  velocityRange: 2.0,
);


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool get scrollTest => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hand Signature",
          style: TextStyle(color: Colors.pink,
            wordSpacing: 2.0,
            letterSpacing: 1.5,
            fontStyle: FontStyle.italic,
            decorationColor: Colors.purple,
            //backgroundColor: Colors.green,
            decorationStyle: TextDecorationStyle.dotted,
            fontFamily: 'Roboto',
            height: 1.5,
            shadows: [Shadow(color: Colors.black,
                offset: Offset(2, 2))],
            fontWeight: FontWeight.bold),),
      ),
      body:
      SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(),
                          color: Colors.white,
                          child: HandSignature(
                            control: control,
                            type: SignatureDrawType.shape,
                          ),
                        ),
                        CustomPaint(
                          painter: DebugSignaturePainterCP(
                            control: control,
                            cp: false,
                            cpStart: false,
                            cpEnd: false,
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: const EdgeInsets.all(15),
                    textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    control.clear();
                  },
                  child: Text("Clear")
              ),
            )
          ],
        ),
      ),
    );
  }
}