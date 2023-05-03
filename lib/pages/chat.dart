import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/nav_bar.dart';

import '../classes/message.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPage();
}

class _ChatPage extends State {
  List<String> _items = ['abc', 'def'];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _inputController = TextEditingController();

  _ChatPage() {
    loadData();
  }

  void sendMessage() {
    setState(() {
      _items.add(_inputController.text);
    });
  }

  void loadData() async {
    final DocumentSnapshot snapshot =
        await firestore.collection('chats').doc('chats').get();
    final Object? data = snapshot.data();

    print('eeee');

    // var snapshot =
    //     await firestore.collection('chats').get();
    // print('snpshot');

    // var x = snapshot.docs.map((doc) {
    //   Map<String, dynamic> data = doc.data();
    //   return Message(data['user'], data['text'], data['dataTime']);
    // }).toList();

    print("____________");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          buildInputFiled(_inputController)
        ],
      ),
    );
  }

  buildInputFiled(TextEditingController inputController) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 186, 182, 182),
            child: Center(
              child: TextField(
                controller: inputController,
                decoration: InputDecoration(
                  labelText: 'napisz|',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        sendMessage();
                        setState(() {
                          inputController.clear();
                        });
                      },
                      icon: Icon(Icons.arrow_forward)),
                ),
                onChanged: (value) {
                  //_input = value;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
