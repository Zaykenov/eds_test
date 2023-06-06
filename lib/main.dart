import 'package:eds_test/presentation/main_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task Application',
      home: MainPage(),
    );
  }
}
