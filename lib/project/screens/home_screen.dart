import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/project/providers/tasks_provider.dart';
import 'package:todo_list/project/widgets/detail_box.dart';
import 'package:todo_list/project/widgets/task_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(),
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
                Consumer<TaskProvider>(
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
                )
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        const Text(
          "Todo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30,
          ),
        )
      ],
    );
  }
}
