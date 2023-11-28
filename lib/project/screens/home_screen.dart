import 'package:flutter/material.dart';
import 'package:todo_list/project/widgets/detail_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTaskTracker() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DetailBox(
          title: "Created tasks",
          counter: 1,
        ),
        DetailBox(
          title: "Completed tasks",
          counter: 1,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ],
    );
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
          "Tasks",
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
