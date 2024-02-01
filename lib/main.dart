import 'package:assigment_app/Screen_Dashboard.dart';
import 'package:flutter/material.dart';

//import 'package:assigment_app/data_hive/screens/show_data_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: ScreenDashboard()
    );
  }
}
