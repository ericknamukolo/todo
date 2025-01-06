class Task {
  String id;
  String title;
  bool complete;

  Task({
    required this.id,
    required this.title,
    this.complete = false,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? complete,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      complete: complete ?? this.complete,
    );
  }
}
