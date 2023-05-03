import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPage();
}

class _ChatPage extends State {
  List<String> _items = ['abc', 'def'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('chat  |'),
        ),
        drawer: NavBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == _items.length) {
                    return Text('');
                  } else {
                    return ListTile(title: Text(_items[index]));
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 186, 182, 182),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'napisz',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                print('object');
                              },
                              icon: Icon(Icons.arrow_forward)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
