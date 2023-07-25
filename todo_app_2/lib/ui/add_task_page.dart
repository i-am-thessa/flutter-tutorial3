import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_2/ui/theme.dart';
import 'package:todo_app_2/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController _taskTitleController = TextEditingController();

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add Task', style: headingStyle),
              const SizedBox(height: 10),
              MyInputField(
                  title: 'Title',
                  hint: 'Enter your title',
                  controller: _taskTitleController,
                  widget: widget),
              MyInputField(
                  title: 'Note',
                  hint: 'Enter note here',
                  controller: _taskTitleController,
                  widget: widget),
              MyInputField(
                  title: 'Date',
                  hint: 'Enter date here',
                  controller: _taskTitleController,
                  widget: widget),
              MyInputField(
                  title: 'Time',
                  hint: 'Create Start and End Time Row here',
                  controller: _taskTitleController,
                  widget: widget),
              MyInputField(
                  title: 'Remind',
                  hint: 'Enter reminder here',
                  controller: _taskTitleController,
                  widget: widget),
              MyInputField(
                  title: 'Repeat',
                  hint: 'Enter repeat here',
                  controller: _taskTitleController,
                  widget: widget),
              MyInputField(
                  title: 'Color and Create Task',
                  hint: 'Create color and button row here',
                  controller: _taskTitleController,
                  widget: widget),
            ],
          ),
        ),
      ),
    );
  }

  _appBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white, // TODO could not recognize context
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/profile.jpg",
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
