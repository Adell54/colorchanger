import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer',
      debugShowCheckedModeBanner: false,
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color baseColor = Colors.blue;
  int directionIndex = 0;

 
  final List<List<Alignment>> directions = [
    [Alignment.topCenter, Alignment.bottomCenter],
    [Alignment.centerLeft, Alignment.centerRight],
    [Alignment.topLeft, Alignment.bottomRight],
    [Alignment.topRight, Alignment.bottomLeft]
  ];


  final List<String> directionNames = [
    'Vertical',
    'Horizontal',
    'Diagonal ',
    'Diagonal ',
  ];

  
  Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }


  void changeColor() {
    setState(() {
      baseColor = getRandomColor();
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % directions.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    final gradient = LinearGradient(
      begin: directions[directionIndex][0],
      end: directions[directionIndex][1],
      colors: [baseColor, baseColor.withAlpha(70)],
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: changeColor,
                child: Text('Change Color',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 20),
              Text(
                'RGB: ${baseColor.red}, ${baseColor.green}, ${baseColor.blue}',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: changeDirection,
                child: Text('Change Direction', style: TextStyle(
                  color: Colors.white
                ),),
              ),
              SizedBox(height: 10),
              Text(
                'Direction: ${directionNames[directionIndex]}',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
