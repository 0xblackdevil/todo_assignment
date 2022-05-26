import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/const.dart';
import 'package:todo_assignment/controller/todo_controller.dart';

class TopContainer extends StatelessWidget {
  TopContainer({Key? key}) : super(key: key);

  final getController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(
            Icons.list,
            color: customColor,
            size: 40,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Todoey",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${getController.todos.length} Tasks",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
