import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> list;
  ToDoList(this.list);
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((todo) => _item(todo, context)).toList());
  }

  Widget _item(todo, context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (bool? value) {
            Provider.of<MyState>(context, listen: false).changed(todo, value);
          },
          activeColor: Colors.pink[100],
        ),
        title: Text(todo.todo, style: const TextStyle(fontSize: 16)),
        trailing: IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).deleteItem(todo);
          },
          icon: const Icon(Icons.delete, color: Colors.black38),
        ),
      ),
    );
  }
}
