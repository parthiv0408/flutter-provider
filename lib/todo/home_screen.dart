import 'package:flutter/material.dart';
import 'package:flutter_provider/todo/model/todo_model.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  OutlineInputBorder outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        labelText: 'Enter todo',
                        border: outlineInputBorder,
                        disabledBorder: outlineInputBorder,
                        enabledBorder: outlineInputBorder),
                  ),
                ),
                SizedBox(width: 12),
                FilledButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTodo(Todo(title: controller.text));
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoProvider.todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      trailing: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (value) {
                          todoProvider.toggleTodoStatus(index);
                        },
                      ),
                      onLongPress: () {
                        todoProvider.removeTodo(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
