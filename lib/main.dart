import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'enums/pages.dart';

import 'widgets/nav_bar.dart';
import 'pages/resistor_calculator.dart';
import 'pages/chat.dart';

import 'store/gloab_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print('building');
    return MaterialApp(
      home: ValueListenableBuilder<Pages>(
        valueListenable: globalState.currentPage,
        builder: (BuildContext bc, Pages p, Widget? child) => Navigator(
          onPopPage: (route, result) {
            print('poping');
            if (!route.didPop(result)) {
              return false;
            }
            return true;
          },
          pages: [
            if (globalState.currentPage.value == Pages.home)
              MaterialPage(
                  child: MyHomePage(title: 'Flutter Demooo Home Page')),
            if (globalState.currentPage.value == Pages.resistor_calculator)
              MaterialPage(child: ResistorCalculatorPage()),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> futureApp = Firebase.initializeApp();
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
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder(
        future: futureApp,
        builder: (context, snapshot) => snapshot.hasError
            ? Text('blad')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Counter:',
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
