import 'package:flutter/material.dart';
import 'package:flutter_assg/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  void addTodo(String todo) {
    _todos.add(
      ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: todo,
        isDone: false,
      ),
    );
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void toggleTodo(String id) {
    int index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index].isDone = !_todos[index].isDone;
      notifyListeners();
    }
  }
}
