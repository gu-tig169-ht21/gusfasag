import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class SecondView extends StatelessWidget {
  final toDoInputField = TextEditingController();

  SecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle: const TextStyle(fontSize: 24, color: Colors.white),
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        children: [
          _ToDoInputField(),
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
              Provider.of<MyState>(context, listen: false).addTask(
                ToDo(title: toDoInputField.text, id: ''),
              );
              toDoInputField.clear();
            },
          ),
        ],
      ),
    );
  }

  Widget _ToDoInputField() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
          cursorColor: Colors.pink,
          controller: toDoInputField,
          decoration: const InputDecoration(
            hintText: 'What´s on your to-do list?',
            hintStyle: TextStyle(color: Colors.black38),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),
          )),
    );
  }
}
