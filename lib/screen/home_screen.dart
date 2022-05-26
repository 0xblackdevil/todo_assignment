import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/const.dart';
import 'package:todo_assignment/controller/todo_controller.dart';
import 'package:todo_assignment/model/todo.dart';
import 'package:todo_assignment/widgets/task_list.dart';
import 'package:todo_assignment/widgets/top_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController todoController = TextEditingController();

  final getController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TopContainer(),
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: const TaskList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(context),
        backgroundColor: customColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future addTask(context) => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(
                    color: customColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  controller: todoController,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {
                    getController.addTodo(Todo(
                      task: todoController.text,
                      isCompleate: false,
                    ));
                    todoController.clear();
                    Navigator.pop(context);
                  },
                  color: customColor,
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
