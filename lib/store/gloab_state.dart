import 'package:flutter/material.dart';
import 'package:some_app/enums/pages.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class GlobalState {
  late Future<FirebaseApp> futureApp;

  ValueNotifier<Pages> currentPage = ValueNotifier<Pages>(Pages.home);
}

GlobalState globalState = new GlobalState();
