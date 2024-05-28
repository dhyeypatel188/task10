import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task10/Auth/login.dart';
import 'package:task10/Auth/signup.dart';

import 'package:task10/pages/dashbord.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
  var jobs = await Hive.openBox('jobs');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signupPage(),
    );
  }
}
