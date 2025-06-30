class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});
  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: 'Buy groceries', isDone: false),
      ToDo(id: '2', todoText: 'Walk the dog', isDone: true),
      ToDo(id: '3', todoText: 'Read a book', isDone: false),
      ToDo(id: '4', todoText: 'Complete homework', isDone: true),
      ToDo(id: '5', todoText: 'Call mom', isDone: false),
    ];
  }
}
