import 'package:flutter/material.dart';

import '../store/gloab_state.dart';
import '../enums/pages.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail'),
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('home'),
              onTap: () {
                print('home');
                globalState.currentPage.value = Pages.home;
                //globalState.currentPage = Pages.resistor_calculator;
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('czat'),
              onTap: () {
                print('czat');
                globalState.currentPage.value = Pages.chat;
                //globalState.currentPage = Pages.resistor_calculator;
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('Arduino'),
              onTap: () {
                print('czat');
                globalState.currentPage.value = Pages.arduino;
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('kalkulator'),
              onTap: () {
                print('kalkultor');
                globalState.currentPage.value = Pages.resistor_calculator;
                //globalState.currentPage = Pages.resistor_calculator;
              },
            ),
          ],
        ),
      );
}
