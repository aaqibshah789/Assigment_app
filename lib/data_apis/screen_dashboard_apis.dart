import 'package:flutter/material.dart';

class ScreenDashboardApis extends StatefulWidget {
  const ScreenDashboardApis({super.key});

  @override
  State<ScreenDashboardApis> createState() => _ScreenDashboardApisState();
}

class _ScreenDashboardApisState extends State<ScreenDashboardApis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:Center(
            child: Text("Apis Dashboard")),
      ),
    );
  }
}
