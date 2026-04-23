class TodoController {
  static final TodoController _instance = TodoController._internal();

  factory TodoController._internal() =>
      _instance; // ISTILAH FACTORY CONSTRUCTOR : Singleton
  TodoController._internal();

  void addTodo() async {
    final Box<Todo> todoBox = Hive.box<Todo>('todos');
    await box.add(add);
  }

  void updateTodo() async {
    // Logic to update a todo item
  }

  void deleteTodo() async {
    // Logic to delete a todo item
  }
}
