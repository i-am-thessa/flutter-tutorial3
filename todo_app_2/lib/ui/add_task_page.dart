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
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> listRemind = [5, 10, 15, 20];

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
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: 'Start Time',
                      hint: _startTime,
                      controller: _timeStartController,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyInputField(
                      title: 'End Time',
                      hint: _endTime,
                      controller: _timeEndController,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                title: 'Remind',
                hint: "$_selectedRemind minutes early",
                controller: _reminderController,
                widget: DropdownButton(
                  items: listRemind.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedRemind = int.parse(value!);
                    });
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                ),
              ),
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
      lastDate: DateTime(2130),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("Null or Something is Wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    String _formattedTime = _pickedTime.format(context);
    if (_pickedTime == null) {
      print("time cancelled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
