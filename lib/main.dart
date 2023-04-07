import 'package:flutter/material.dart';
import 'package:toonder_app/layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toonder',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}