import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'enums/pages.dart';

import 'widgets/nav_bar.dart';
import 'pages/resistor_calculator.dart';
import 'pages/chat.dart';
import 'pages/arduino.dart';
import 'pages/home.dart';

import 'store/gloab_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //globalState.futureApp = await Firebase.initializeApp();
  globalState.futureApp = Firebase.initializeApp();
  await globalState.futureApp;
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
    return MaterialApp(
      home: ValueListenableBuilder<Pages>(
        valueListenable: globalState.currentPage,
        builder: (BuildContext bc, Pages p, Widget? child) => Navigator(
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            return true;
          },
          pages: [
            if (globalState.currentPage.value == Pages.home)
              MaterialPage(child: MyHomePage(title: 'Home ee')),
            if (globalState.currentPage.value == Pages.resistor_calculator)
              MaterialPage(child: ResistorCalculatorPage()),
            if (globalState.currentPage.value == Pages.chat)
              MaterialPage(child: ChatPage()),
            if (globalState.currentPage.value == Pages.arduino)
              MaterialPage(child: ArduinoPage()),
          ],
        ),
      ),
    );
  }
}
