import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_view.dart';
import 'list.dart';
import 'state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Object filtervalue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink[100],
            child: const Icon(
              Icons.create,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('To Do List'),
          titleTextStyle: const TextStyle(fontSize: 28, color: Colors.white),
          backgroundColor: Colors.pink[100],
          actions: [
            PopupMenuButton(
                color: Colors.pink[100],
                icon: const Icon(Icons.menu, color: Colors.white),
                onSelected: (int value) {
                  Provider.of<MyState>(context, listen: false)
                      .setFilterBy(value);
                },
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          child: Text(
                            'Show all',
                            textAlign: TextAlign.right,
                          ),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 17.0),
                          value: 0),
                      const PopupMenuItem(
                          child: Text('Done!'),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 17.0),
                          value: 1),
                      const PopupMenuItem(
                          child: Text('Not done yet..'),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 17.0),
                          value: 2),
                    ]),
          ],
        ),
        body: Consumer<MyState>(
          builder: (context, state, child) =>
              ToDoList(_filterList(state.list, state.filterBy)),
        ));
  }

  List<ToDo> _filterList(list, filterBy) {
    if (filterBy == 0) return list;
    if (filterBy == 1) {
      return list.where((task) => task.done == true).toList();
    }
    if (filterBy == 2) {
      return list.where((task) => task.done == false).toList();
    }
    return list;
  }
}
