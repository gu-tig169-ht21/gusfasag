import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CheckBoxState {
  final String title;
  bool value;
  CheckBoxState({
    required this.title,
    this.value = false,
  });
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final toDos = [
    CheckBoxState(title: 'Träna'),
    CheckBoxState(title: 'Handla'),
    CheckBoxState(title: 'Laga mat'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle: const TextStyle(fontSize: 24, fontFamily: 'helvetica'),
        backgroundColor: Colors.pink[100],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            alignment: Alignment.centerRight,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondView()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ...toDos.map(buildSingleCheckbox).toList(),
        ],
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.pink[100],
      value: checkbox.value,
      title: Text(checkbox.title,
          style: const TextStyle(
              fontSize: 18, fontFamily: 'helvetica', color: Colors.black87)),
      secondary: const Icon(Icons.delete),
      onChanged: (value) => setState(
            () => checkbox.value = value!,
          ));
}

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink[100]),
      body: Center(
        child: Column(
          children: [
            _nameInputField(),
            Container(height: 24),
            _buttonRow(),
          ],
        ),
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'What´s on your to-do list?',
          hintStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'helvetica',
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
        ),
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.black54),
        )
      ],
    );
  }
}
