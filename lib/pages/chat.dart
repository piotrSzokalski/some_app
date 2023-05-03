import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPage();
}

class _ChatPage extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('chat'),
        ),
        drawer: NavBar(),
        body: Text('chat'),
      );
}
