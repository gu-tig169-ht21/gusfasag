import 'package:flutter/material.dart';

class ToDo extends ChangeNotifier {
  String todo;
  bool isDone;
  ToDo({required this.todo, this.isDone = false});
}

class MyState extends ChangeNotifier {
  final List<ToDo> _list = [];
  int _filter = 0;
  List<ToDo> get list => _list;
  int get filterBy => _filter;
  void addText(ToDo todo) {
    list.add(todo);
    notifyListeners();
  }

  void changed(ToDo todo, value) {
    todo.isDone = value;
    notifyListeners();
  }

  void filter(int filter) {
    _filter = filter;
    notifyListeners();
  }

  void deleteItem(ToDo todo) {
    list.remove(todo);
    notifyListeners();
  }
}
