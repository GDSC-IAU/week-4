import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/helpers/constants.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/providers/days_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/widgets/day_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void removeTask(Task task) {
    Provider.of<DaysProvider>(context, listen: false).deleteTask(task,
        Provider.of<DaysProvider>(context, listen: false).days[_selectedIndex]);
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DaysProvider>(
      builder: (context, daysProvider, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 253, 254, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 253, 254, 1),
            elevation: 0,
            title: const Text(
              'Todo App',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const Text(
                  'Hello Anas!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Constants.h16,
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: daysProvider.days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DayCard(
                        selectedIndex: _selectedIndex,
                        day: daysProvider.days[index],
                        index: index,
                        onTapFunction: () {
                          updateSelectedIndex(index);
                        },
                      );
                    },
                  ),
                ),
                Constants.h16,
                Text(
                  DateFormat.yMMMMEEEEd()
                      .format(daysProvider.days[_selectedIndex].date),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Constants.h16,
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: myController,
                          decoration: const InputDecoration(
                            hintText: "Add Task",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Constants.w16,
                    SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            daysProvider.addTask(Task(title: myController.text),
                                daysProvider.days[_selectedIndex]);
                            myController.clear();
                          });
                        },
                        icon: const Icon(Icons.add),
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(12),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(78, 90, 232, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Constants.h20,
                ListView.builder(
                  itemCount: daysProvider.days[_selectedIndex].tasks.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          extentRatio: 0.6,
                          motion: const ScrollMotion(),
                          children: [
                            Constants.w4,
                            const SlidableAction(
                              onPressed: null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              backgroundColor: Color.fromRGBO(81, 194, 146, 1),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Update',
                            ),
                            Constants.w4,
                            SlidableAction(
                              onPressed: (BuildContext context) {
                                setState(() {
                                  daysProvider.days[_selectedIndex].deleteTask(
                                      daysProvider
                                          .days[_selectedIndex].tasks[index]);
                                });
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              backgroundColor:
                                  const Color.fromRGBO(255, 70, 102, 1),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Remove',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(78, 90, 232, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 100,
                          width: double.infinity,
                          child: TaskCard(
                              task: daysProvider
                                  .days[_selectedIndex].tasks[index]),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
