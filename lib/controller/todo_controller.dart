import 'package:get/get.dart';
import 'package:todo_assignment/model/todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;

  addTodo(Todo todo) => todos.add(todo);

  updateTodoStatus(int index, bool status) => todos[index].isCompleate = status;

  deleteTodo(int index) => todos.removeAt(index);
}
