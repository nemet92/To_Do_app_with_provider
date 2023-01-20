import 'package:flutter/material.dart';

class TodoListitemWidget extends StatelessWidget {
  const TodoListitemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (value) {
          debugPrint(value.toString());
        },
      ),
      title: const Text("Spora Git"),
    );
  }
}
