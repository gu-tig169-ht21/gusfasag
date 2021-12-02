import 'package:flutter/material.dart';
import 'package:my_first_app/list.dart';
import 'todo_fetcher.dart';

class ToDo {
  String id;
  String title;
  bool done;
  ToDo({this.id = '', required this.title, this.done = false});
  static Map<String, dynamic> toJson(ToDo task) {
    return {
      'title': task.title,
      'done': task.done,
      'id': task.id,
    };
  }

  static ToDo fromJson(Map<String, dynamic> json) {
    return ToDo(title: json['title'], done: json['done'], id: json['id']);
  }
}

class MyState extends ChangeNotifier {
  late List<ToDo> _list = [];
  Object _filterBy = 'all';
  List<ToDo> get list => _list;
  Object get filterBy => _filterBy;
  Future fetchTodo() async {
    List<ToDo> list = await ToDoFetcher.fetchTodo();
    _list = list;
    notifyListeners();
  }

  void addTask(ToDo task) async {
    _list = await ToDoFetcher.addTodo(task);
    notifyListeners();
  }

  void deleteItem(ToDo toDo) async {
    _list = await ToDoFetcher.deleteTodo(toDo.id);
    notifyListeners();
  }

  void changed(ToDo task, value) async {
    task.done = !task.done;
    /*list = await ToDoFetcher.updateTodo(task, task.id);*/
    await ToDoFetcher.updateTodo(task, value);
    notifyListeners();
  }

  void setFilterBy(Object filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
