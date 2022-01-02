import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Paint paint = Paint();
    paint.color = Colors.brown.shade200;
    Paint paint2 = Paint();
    paint2.color = Colors.purple.shade200;
    Paint paint3 = Paint();
    paint3.color = Colors.blueGrey.shade200;
    const primaryColor = Color(0xFF795548);

    return MaterialApp(
        title: 'Motivación diaria',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: AppBar(
              title: Center(
            child: Text('Motivación diaria'),
          )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'TRABAJO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    background: paint3,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 100),
                Text(
                  'El único modo de hacer un gran trabajo es amar lo que haces ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    background: paint,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      '- Steve Jobs ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        background: paint2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
