class TodoModel {
  final String id;

  final String decription;
  final bool completed;

  TodoModel(
      {required this.id, required this.decription, this.completed = false});
}
