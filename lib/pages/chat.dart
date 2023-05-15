import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/nav_bar.dart';

import '../classes/message.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPage();
}

class _ChatPage extends State {
  List<String> _items = ['wiadomosc1', 'wiadomosc 20'];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _inputController = TextEditingController();

  _ChatPage() {
    loadData();
  }

  void sendMessage() {
    loadData();
    setState(() {
      _items.add(_inputController.text);
    });
  }

  void loadData() async {
    print("________________________");
    print('loading data');

    var x = await firestore.collection('users').get();
    x.docs.forEach((element) {
      print('entry');
      print(element.data());
    });

    print("________________________");
    //QuerySnapshot querySnapshot = await firestore.collection('users').get();
    // querySnapshot.docs.forEach((doc) {
    //   print('entry');
    //   print(doc.data());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Czat'),
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
                          //loadData();
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
