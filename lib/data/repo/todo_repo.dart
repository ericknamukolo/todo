class TodoRepo {
  static Future<void> createTodo() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
