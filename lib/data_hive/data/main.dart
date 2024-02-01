
import 'package:assigment_app/data_hive/ScreenDashboardHive.dart';
import 'package:assigment_app/data_hive/data/model_class.dart';
import 'package:assigment_app/data_hive/data/screens/show_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(StudentDataAdapter());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  title: 'ASSIGMENT ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    home:  ScreenDashboardHive(),
    );
  }
}
