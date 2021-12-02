import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'state.dart';

class ToDoList extends StatefulWidget {
  final List<ToDo> list;
  ToDoList(this.list);
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _item(context, widget.list[index]),
      itemCount: widget.list.length,
    );
  }

  Widget _item(context, task) {
    return ListTile(
        leading: RoundCheckBox(
          isChecked: task.done,
          onTap: (value) {
            Provider.of<MyState>(context, listen: false).changed(task, value);
          },
          checkedColor: Colors.pink[100],
          size: 24.0,
          checkedWidget: const Icon(Icons.check, size: 17, color: Colors.white),
          borderColor: Colors.pink[100],
        ),
        title: Text(task.title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 17, color: Colors.black87)),
        trailing: IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).deleteItem(task);
          },
          icon: Icon(Icons.delete, color: Colors.black26),
        ));
  }
}
