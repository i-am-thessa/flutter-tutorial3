import 'package:flutter/material.dart';
import 'package:todo_app_1/screens/home/widgets/go_premium.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoPremium(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Hi, Hawkins',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40,
        ),
      ],
    );
  }
}
