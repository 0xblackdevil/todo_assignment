import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/controller/todo_controller.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final getController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return GetX<TodoController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (BuildContext context, int index) {
            var doc = controller.todos[index];
            return ListTile(
              onLongPress: () {
                getController.deleteTodo(index);
              },
              title: Text(
                doc.task.toString(),
                style: TextStyle(
                  decoration: doc.isCompleate == false
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              trailing: Checkbox(
                onChanged: (bool? value) {
                  getController.updateTodoStatus(index, !doc.isCompleate);
                  setState(() {});
                },
                value: doc.isCompleate,
              ),
            );
          },
        );
      },
    );
  }
}
