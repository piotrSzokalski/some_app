import 'package:flutter/material.dart';

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
        body: Text('chat'),
      );
}
