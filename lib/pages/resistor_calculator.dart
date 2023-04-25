import 'package:flutter/material.dart';

class ResistorCalculatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResistorCalculatorPage();
}

class _ResistorCalculatorPage extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Kalkulator rezystncji')),
        body: Text('Kalkulator'),
      );
}
