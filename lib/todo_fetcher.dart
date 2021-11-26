import 'state.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'https://todoapp-api-pyq5q.ondigitalocean.app';
const key = 'c21c3919-84e2-4641-b3cc-b1ab992ea921';

class ToDoFetcher {
  static Future<List<ToDo>> fetchTodo() async {
    http.Response response = await http.get(Uri.parse('$url/todos?key=$key'));
    print(response.body);
    var json = jsonDecode(response.body);
    return json.map<ToDo>((data) {
      return ToDo.fromJson(data);
    }).toList();
  }

  static Future addTodo(ToDo task) async {
    var json = jsonEncode(ToDo.toJson(task));
    print(json);
    await http.post(
      Uri.parse('$url/todos?key=$key'),
      body: json,
      headers: {'Content-type': 'application/json'},
    );
  }

  static Future updateTodo(ToDo task, String id) async {
    var json = jsonEncode(ToDo.toJson(task));
    print(json);
    await http.put(Uri.parse('$url/todos/:id?key=$key'),
        body: json, headers: {'Content-type': 'application/json'});
  }

  static Future deleteTodo(String id) async {
    await http.delete(Uri.parse('$url/todos/:id?key=$key'));
  }
}
