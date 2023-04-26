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
              title: const Text('kalkulator'),
              onTap: () {
                print('kalkultor');
                globalState.currentPage = Pages.resistor_calculator;
              },
            )
          ],
        ),
      );
}
