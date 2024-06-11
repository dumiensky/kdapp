class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  Todo.fromMap(Map<String, dynamic> map)
    : this(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['completed'] as bool
    );
}