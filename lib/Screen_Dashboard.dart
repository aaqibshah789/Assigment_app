import 'package:assigment_app/data_apis/screen_dashboard_apis.dart';
import 'package:assigment_app/data_hive/ScreenDashboardHive.dart';

import 'package:assigment_app/data_hive/data/screens/show_data_screen.dart';
import 'package:assigment_app/data_sqflite/screen_dashboard_sqflite.dart';
import 'package:flutter/material.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Assigment Dashboard")),),
    body: Container(
      width:double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ScreenDashboardApis()));
          }, child: Text("Apis Dashboard"),),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ScreenDashboardSqflite()));
          }, child: Text("SQFLITE  Dashboard"),),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ScreenDashboardHive()));
          }, child: Text("hive  Dashboard"),)
        ],
      ),
    ));
  }
}
