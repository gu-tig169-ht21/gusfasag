import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_view.dart';
import 'list.dart';
import 'state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle: const TextStyle(fontSize: 24),
        backgroundColor: Colors.pink[100],
        actions: [
          PopupMenuButton<int>(
              color: Colors.pink[100],
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).filter(value);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        child: Text(
                          'Show all',
                          textAlign: TextAlign.right,
                        ),
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                        value: 0),
                    const PopupMenuItem(
                        child: Text('Done!'),
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                        value: 1),
                    const PopupMenuItem(
                        child: Text('Not done yet..'),
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                        value: 2),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            ToDoList(_filter(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[100],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          }),
    );
  }

  List<ToDo> _filter(list, filterBy) {
    if (filterBy == 0) return list;
    if (filterBy == 1) {
      return list.where((item) => item.isDone == true).toList();
    }
    if (filterBy == 2) {
      return list.where((item) => item.isDone == false).toList();
    }
    return list;
  }
}
