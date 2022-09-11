import 'package:flutter/material.dart';
import 'package:local_database_2/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database_2/pages/sign_in_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('pdp_online');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        SignPage.id : (context) => SignPage(),
        HomePage.id : (context) => HomePage()
      },
    );
  }
}


