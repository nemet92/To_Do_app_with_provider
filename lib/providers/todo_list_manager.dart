import 'package:riverpod/riverpod.dart';
import 'package:todoprovider/model/todo_model.dart';
import 'package:uuid/uuid.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([
    TodoModel(id: const Uuid().v4(), decription: "Spora get"),
    TodoModel(id: const Uuid().v4(), decription: "ALisveris"),
    TodoModel(id: const Uuid().v4(), decription: "Ders calis")
  ]);
});

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo(String description) {
    var eklenecekTodo =
        TodoModel(id: const Uuid().v4(), decription: description);
    state = [...state, eklenecekTodo];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              decription: todo.decription,
              completed: !todo.completed)
        else
          todo,
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              completed: todo.completed,
              decription: newDescription)
        else
          todo
    ];
  }

  void remove(TodoModel silinicekTodo) {
    state = state.where((element) => element.id != silinicekTodo.id).toList();
  }
}
