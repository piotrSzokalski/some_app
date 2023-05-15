import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text('Witaj'),
        ),
      );
}
