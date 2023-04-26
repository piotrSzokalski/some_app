import 'package:flutter/material.dart';
import 'package:some_app/enums/pages.dart';

class GlobalState {
  Pages currentPage = Pages.home;
  ValueNotifier<int> test = ValueNotifier(0);
}

GlobalState globalState = new GlobalState();
