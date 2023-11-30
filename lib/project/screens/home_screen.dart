import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/project/models/task_model.dart';
import 'package:todo_list/project/providers/tasks_provider.dart';
import 'package:todo_list/project/widgets/detail_box.dart';
import 'package:todo_list/project/widgets/task_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create', arguments: [onSubmit]);
        },
        tooltip: 'Create a task',
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Today Tasks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildTaskTracker(),
                const SizedBox(
                  height: 15,
                ),
                buildTasks()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer<TaskProvider> buildTasks() {
    return Consumer<TaskProvider>(
      builder: (_, provider, __) {
        final tasks = provider.tasks;
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            return TaskView(
              task: tasks[index],
            );
          },
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      title: const Text(
        "Todo",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: 24),
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30,
          ),
        )
      ],
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildTaskTracker() {
    return Consumer<TaskProvider>(builder: (_, provider, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DetailBox(
            title: "Created tasks",
            counter: provider.tasks.length,
          ),
          DetailBox(
            title: "Completed tasks",
            counter:
                provider.tasks.where((element) => element.isCompleted).length,
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
        ],
      );
    });
  }

  void onSubmit(
    BuildContext context,
    String title,
    String description,
    TimeOfDay time,
  ) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final task = Task(
      taskName: title,
      taskDescription: description,
      dueTime: time,
    );
    taskProvider.addTask(task);
    Navigator.maybePop(context);
  }
}
