import 'package:budget_tracker/json/day_month.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 25,
                right: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Transaction',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      days.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(
                                  days[index]['label'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? primary
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: activeDay == index
                                          ? primary
                                          : black.withOpacity(0.1),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      days[index]['day'],
                                      style: const TextStyle(
                                          fontSize: 10, color: white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
