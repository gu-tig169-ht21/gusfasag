import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';
import 'state.dart';

void main() {
  var state = MyState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        fontFamily: 'Helvetica',
        unselectedWidgetColor: Colors.pink[100],
      ),
      home: HomeView(),
    );
  }
}
