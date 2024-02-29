import 'package:flutter/material.dart';

import 'data/home_screen.dart';

class ScreenDashboardSqflite extends StatefulWidget {
  const ScreenDashboardSqflite({super.key});

  @override
  State<ScreenDashboardSqflite> createState() => _ScreenDashboardSqfliteState();
}

class _ScreenDashboardSqfliteState extends State<ScreenDashboardSqflite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:Center(
            child: Text("Sqflite Dashboard")),
      ),
      body:Container(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePage()));
        },child: Text("ADD RECORD "),),
      )
    );
  }
}
