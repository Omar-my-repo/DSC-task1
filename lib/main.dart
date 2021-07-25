import 'package:flutter/material.dart';

import 'screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'task1 By Omar Muhammad',
      home: LoginPage(),
    );
  }
}
