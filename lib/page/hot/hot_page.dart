import 'package:flutter/material.dart';
import 'package:toonder_app/page/hot/hot-topic.dart';

class HotPage extends StatelessWidget {
  const HotPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: const Color(0xFF1A182E),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Có gì HOT', style: TextStyle(fontSize: width * 34))),
      body: const HotTopic(),
    );
  }
}
