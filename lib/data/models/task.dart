class Task {
  String id;
  String title;
  bool complete;

  Task({
    required this.id,
    required this.title,
    this.complete = false,
  });
}
