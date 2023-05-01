import 'package:flutter/material.dart';
import 'package:some_app/enums/pages.dart';

class GlobalState {
  ValueNotifier<Pages> currentPage = ValueNotifier<Pages>(Pages.home);
  ValueNotifier<int> test = ValueNotifier(0);
}

GlobalState globalState = new GlobalState();
