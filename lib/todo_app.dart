import 'package:flutter/material.dart';
import 'package:todoprovider/model/todo_model.dart';
import 'package:todoprovider/widget/todo_list_item_widget.dart';
import 'package:todoprovider/widget/toolbar_widget.dart';
import 'package:todoprovider/widget/widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();
  List<TodoModel> allTodos = [
    TodoModel(id: const Uuid().v4(), decription: "Spora get"),
    TodoModel(id: const Uuid().v4(), decription: "Alisveris yap"),
    TodoModel(id: const Uuid().v4(), decription: "Ders calis")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration:
                const InputDecoration(labelText: "Neler yapacaksin bugun?"),
            onSubmitted: (newTodo) {
              debugPrint("sunu ekle $newTodo");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const ToolBarWidget(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(
                  allTodos[i].id,
                ),
                onDismissed: ((direction) {}),
                child: TodoListitemWidget(item: allTodos[i]))
        ],
      ),
    );
  }
}
