import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class SecondView extends StatelessWidget {
  final ToDoInputField = TextEditingController();
  SecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle: const TextStyle(fontSize: 28, color: Colors.white),
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
          ),
          _ToDoInputField(),
          Container(
            padding: EdgeInsets.all(5),
          ),
          FloatingActionButton(
            backgroundColor: Colors.pink[100],
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<MyState>(context, listen: false).addTask(
                ToDo(title: ToDoInputField.text, id: ''),
              );
              ToDoInputField.clear();
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
        style: TextStyle(height: 1.2),
        cursorColor: Colors.pink[200],
        textAlign: TextAlign.center,
        controller: ToDoInputField,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'What´s on your to-do list?',
          hintStyle: TextStyle(fontSize: 17, color: Colors.black54),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
