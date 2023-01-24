import 'package:flutter/material.dart';
import 'package:todoprovider/model/todo_model.dart';

class TodoListitemWidget extends StatelessWidget {
  TodoModel item;
  TodoListitemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (value) {
          debugPrint(value.toString());
        },
      ),
      title: Text(item.decription),
    );
  }
}
