import 'package:flutter/material.dart';
import 'package:todo_list/project/models/task_model.dart';
import 'package:todo_list/project/widgets/custom_input_field.dart';

typedef TaskCallback = void Function(
  BuildContext context,
  String title,
  String description,
  TimeOfDay time,
);

class ManageTaskScreen extends StatefulWidget {
  final TaskCallback callback;
  final Task? task;
  final String buttonLabel;
  final String appBarTitle;

  const ManageTaskScreen({
    required this.buttonLabel,
    required this.appBarTitle,
    required this.callback,
    this.task,
    super.key,
  });

  @override
  State<ManageTaskScreen> createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    Task? task = widget.task;

    if (task != null) {
      selectedTime = task.dueTime;
      titleController.text = task.taskName;
      descriptionController.text = task.taskDescription;
    }

    updateDate();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void updateDate() {
    dateController.text =
        "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomInputField(
                    label: 'Title',
                    controller: titleController,
                    maxLines: 1,
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return "Title shouldn't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomInputField(
                    label: 'Description',
                    controller: descriptionController,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomInputField(
                    label: 'Due Time',
                    controller: dateController,
                    readonly: true,
                    onTap: () async {
                      await displayTimePicker(context);
                    },
                    validator: (_) {
                      final now = TimeOfDay.now();

                      if (selectedTime.hour < now.hour ||
                          (selectedTime.hour == now.hour &&
                              selectedTime.minute <= now.minute)) {
                        return "Time should not pass this time.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (!formKey.currentState!.validate()) return;
          widget.callback(
            context,
            titleController.text,
            descriptionController.text,
            selectedTime,
          );
        },
        child: Text(
          widget.buttonLabel,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> displayTimePicker(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedTime = picked;
      updateDate();
      formKey.currentState!.validate();
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.appBarTitle,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
