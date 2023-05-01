import 'dart:math';

import 'package:flutter/material.dart';

enum ResistorBand { first_band, second_band, multiplier, tolerance }

class ResistorCalculatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResistorCalculatorPage();
}

class _ResistorCalculatorPage extends State {
  List<String> _digits = ['0', '0'];
  double _multiplier = 1;
  int _tolerance = 1;

  int _resistance = 0;

  String formatNumber(int n) {
    return n.toString();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Kalkulator rezystncji')),
        body: Center(
            child: Column(
          children: [
            Text(
              'Rezystancja:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _resistance.toString() + 'Ω',
              style: TextStyle(fontSize: 20),
            ),
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
        Text(_digits[0]),
        for (int i = 0; i < colors.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: colorBox(
              value: i,
              color: colors[i],
              band: ResistorBand.first_band,
            ),
          ),
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
        Text(_digits[1]),
        for (int i = 0; i < colors.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: colorBox(
              value: i,
              color: colors[i],
              band: ResistorBand.second_band,
            ),
          ),
      ],
    );
  }

  Column multiplierBand() {
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
      // 8
      Colors.white,
      Color.fromARGB(255, 231, 220, 118),
      Color.fromARGB(209, 220, 217, 217)
    ];
    return Column(
      children: [
        Text(_multiplier.toString()),
        for (int i = 0; i < colors.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: colorBox(
              value: i,
              color: colors[i],
              band: ResistorBand.multiplier,
            ),
          ),
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
        Text(_resistance.toString()),
        for (int i = 0; i < colors.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: colorBox(
              value: i,
              color: colors[i],
              band: ResistorBand.tolerance,
            ),
          ),
      ],
    );
  }

  Container colorBox({
    required int value,
    Color color = Colors.white,
    ResistorBand band = ResistorBand.first_band,
  }) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: InkWell(
        onTap: () {
          switch (band) {
            case ResistorBand.first_band:
              _digits[0] = value.toString();
              break;
            case ResistorBand.second_band:
              _digits[1] = value.toString();
              break;
            case ResistorBand.multiplier:
              if (value < 9) {
                _multiplier = pow(10, value).toDouble();
              } else if (value == 10) {
                _multiplier = 0.1;
              } else {
                _multiplier = 0.01;
              }
              break;
            case ResistorBand.tolerance:
              //_resistance = value;
              break;
          }
          _resistance = (int.parse(_digits.join('')) * _multiplier) as int;
          setState(() {
            _resistance;
          });
        },
      ),
    );
  }
}
