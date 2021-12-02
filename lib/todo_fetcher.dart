import 'state.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const url = 'https://todoapp-api-pyq5q.ondigitalocean.app';
const key = 'c21c3919-84e2-4641-b3cc-b1ab992ea921';

class ToDoFetcher {
  static Future fetchTodo() async {
    var response = await http.get(Uri.parse('$url/todos?key=$key'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);
    return json.map<ToDo>((data) {
      return ToDo.fromJson(data);
    }).toList();
  }

  static Future<List<ToDo>> addTodo(ToDo task) async {
    Map<String, dynamic> json = ToDo.toJson(task);
    var bodyString = jsonEncode(json);
    var response = await http.post(Uri.parse('$url/todos?key=$key'),
        body: bodyString, headers: {'Content-type': 'application/json'});
    bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<ToDo>((data) {
      return ToDo.fromJson(data);
    }).toList();
  }

  static Future updateTodo(ToDo task, value) async {
    task.done = value;
    Map<String, dynamic> json = ToDo.toJson(task);
    var bodyString = jsonEncode(json);
    await http.put(
      Uri.parse('$url/todos/${task.id}?key=$key'),
      body: bodyString,
      headers: {'Content-type': 'application/json'},
    );
  }

  static Future deleteTodo(String id) async {
    var response = await http.delete(Uri.parse('$url/todos/$id?key=$key'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<ToDo>((data) {
      return ToDo.fromJson(data);
    }).toList();
  }
}
