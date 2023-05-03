import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import '../store/gloab_state.dart';
import '../widgets/nav_bar.dart';

class ArduinoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArduinoPage();
}

class _ArduinoPage extends State<ArduinoPage> {
  late DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  int _counter = 0;
  bool _deviceOn = false;

  void _incrementCounter() async {
    setState(() {
      databaseReference.update({'c': _counter + 1});
    });
  }

  @override
  Widget build(BuildContext context) {
    databaseReference.onValue.listen((event) {
      //print(event.snapshot.value.toString());
      setState(() {
        _counter = int.parse(event.snapshot.child('c').value.toString());
        _deviceOn = event.snapshot.child('DeviceOn').value as bool;
      });
    });

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('ARDUINO'),
      ),
      body: Center(
          child: FutureBuilder(
        future: globalState.futureApp,
        builder: (context, snapshot) => snapshot.hasError
            ? Text('blad')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Counter||:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Switch(
                      value: _deviceOn,
                      onChanged: (x) =>
                          databaseReference.update({'DeviceOn': !_deviceOn}))
                ],
              ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
