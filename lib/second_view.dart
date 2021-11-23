import 'package:flutter/material.dart';
import 'state.dart';
import 'package:provider/provider.dart';

class SecondView extends StatelessWidget {
  final TextEditingController textcontroller = TextEditingController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle: const TextStyle(fontSize: 24),
        backgroundColor: Colors.pink[100],
      ),
      body: Column(children: [
        _nameInputField(),
        Container(
          padding: EdgeInsets.all(10),
        ),
        FloatingActionButton(
          backgroundColor: Colors.pink[100],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            text = textcontroller.text;
            Provider.of<MyState>(context, listen: false)
                .addText(ToDo(todo: text));
            textcontroller.clear();
          },
        ),
      ]),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
          controller: textcontroller,
          decoration: const InputDecoration(
            hintText: 'What´s on your to-do list?',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),
          )),
    );
  }
}
