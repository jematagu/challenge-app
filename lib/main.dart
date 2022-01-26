import 'package:flutter/material.dart';
import 'LogIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyMainPage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogIn(),
    );
  }
}
