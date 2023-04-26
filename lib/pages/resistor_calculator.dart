import 'dart:math';

import 'package:flutter/material.dart';

enum ResistorBand { first_band, second_band, multiplier, tolerance }

class ResistorCalculatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResistorCalculatorPage();
}

class _ResistorCalculatorPage extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Kalkulator rezystncji')),
        body: Center(
            child: Column(
          children: [
            Text('Rezystancja'),
            Row(
              children: [
                Expanded(
                  child: firstBand(),
                ),
                Expanded(
                  child: secondBand(),
                ),
                Expanded(
                  child: multiplierBand(),
                ),
                Expanded(
                  child: toleranceBand(),
                ),
              ],
            )
          ],
        )),
      );

  Column firstBand() {
    List<Color> colors = [
      Colors.brown,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.green,
      Colors.grey,
      Colors.white
    ];
    return Column(
      children: [
        for (Color c in colors) colorBox(color: c),
      ],
    );
  }

  Column secondBand() {
    List<Color> colors = [
      Colors.black,
      Colors.brown,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.grey,
      Colors.white
    ];
    return Column(
      children: [
        for (Color c in colors) colorBox(color: c),
      ],
    );
  }

  Column multiplierBand() {
    List<Color> colors = [
      Colors.white,
      Colors.yellow,
      Colors.black,
      Colors.brown,
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue
    ];
    return Column(
      children: [
        for (Color c in colors) colorBox(color: c),
      ],
    );
  }

  Column toleranceBand() {
    List<Color> colors = [
      Colors.grey,
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.brown,
      Colors.red,
      Colors.yellow,
      Colors.white,
      Colors.black
    ];
    return Column(
      children: [
        for (Color c in colors) colorBox(color: c),
      ],
    );
  }

  Container colorBox(
      {Color color = Colors.white,
      ResistorBand band = ResistorBand.first_band}) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: InkWell(
        onTap: () => print('abc'),
      ),
    );
  }
}
