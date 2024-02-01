import 'package:assigment_app/data_hive/data/screens/show_data_screen.dart';
import 'package:flutter/material.dart';

class ScreenDashboardHive extends StatefulWidget {
  const ScreenDashboardHive({super.key});

  @override
  State<ScreenDashboardHive> createState() => _ScreenDashboardHiveState();
}

class _ScreenDashboardHiveState extends State<ScreenDashboardHive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title:Center(
          child: Text("Hive Dashboard")),

    ),
        body:Container(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>ShowDataScreen()));
        },child: Text("add"),),

      ),

    );
  }
}
