import 'package:flutter/material.dart';
import 'package:flutter_provider/todo/model/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
