import 'package:flutter/material.dart';
import 'package:todo_app_1/models/task.dart';
import 'package:todo_app_1/screens/detail/widgets/datepicker.dart';
import 'package:todo_app_1/screens/detail/widgets/task_title.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  const DetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, task),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DatePicker(),
                  TaskTitle(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context, Task task) {
  return SliverAppBar(
    expandedHeight: 90,
    backgroundColor: Colors.black,
    leading: IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back_ios),
      iconSize: 20,
    ),
    actions: const [
      Icon(
        Icons.more_vert,
        size: 40,
      )
    ],
    flexibleSpace: FlexibleSpaceBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${task.title} tasks',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'You have ${task.left} tasks for today!',
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    ),
  );
}
