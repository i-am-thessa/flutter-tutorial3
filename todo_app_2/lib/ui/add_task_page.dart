import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_2/ui/theme.dart';
import 'package:todo_app_2/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeStartController = TextEditingController();
  TextEditingController _timeEndController = TextEditingController();
  TextEditingController _reminderController = TextEditingController();
  TextEditingController _repeatController = TextEditingController();

  @override
  void dispose() {
    _taskTitleController.dispose();
    _notesController.dispose();
    _dateController.dispose();
    _timeStartController.dispose();
    _timeEndController.dispose();
    _reminderController.dispose();
    _repeatController.dispose();
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
                  controller: _taskTitleController),
              MyInputField(
                  title: 'Note',
                  hint: 'Enter note here',
                  controller: _notesController),
              MyInputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                controller: _dateController,
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    print("hi there");
                    _getDateFromUser();
                  },
                ),
              ),
              // Expanded(
              //   child: Row(
              //     children: [
              //       MyInputField(
              //           title: 'Start Time',
              //           hint: 'Create Start and End Time Row here',
              //           controller: _timeStartController,
              //           widget: widget),
              //       MyInputField(
              //           title: 'End Time',
              //           hint: 'Create Start and End Time Row here',
              //           controller: _timeEndController,
              //           widget: widget),
              //     ],
              //   ),
              // ),
              // MyInputField(
              //     title: 'Remind',
              //     hint: 'Enter reminder here',
              //     controller: _reminderController,
              //     widget: widget),
              // MyInputField(
              //     title: 'Repeat',
              //     hint: 'Enter repeat here',
              //     controller: _repeatController,
              //     widget: widget),
              // MyInputField(
              //     title: 'Color and Create Task',
              //     hint: 'Create color and button row here',
              //     controller: _taskTitleController,
              //     widget: widget),
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

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );

    if (_pickerDate != null) {
      _selectedDate = _pickerDate;
    } else {
      print("Null or Something is Wrong");
    }
  }
}
