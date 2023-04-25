import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail'),
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(),
              ),
            ),
            ListTile(
              leading: Icon(Icons.abc),
              title: Text('kalkulator'),
              onTap: () {
                print('kalkultor');
              },
            )
          ],
        ),
      );
}
