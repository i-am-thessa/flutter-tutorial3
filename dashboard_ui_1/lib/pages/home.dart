import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _top(context),
          const SizedBox(height: 20.0),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                Text(
                  'View All',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 200.0,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 3 / 2,
              ),
              children: [
                _gridItem(Icons.airport_shuttle, context),
                _gridItem(Icons.add_shopping_cart, context),
                _gridItem(Icons.arrow_drop_down_circle, context),
                _gridItem(Icons.bluetooth_searching, context),
                _gridItem(Icons.add_location, context),
                _gridItem(Icons.arrow_drop_down_circle, context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_gridItem(icon, context) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        child: Icon(icon, size: 16.0, color: Colors.white),
      )
    ],
  );
}

_top(context) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    ),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Hi, Hawkins',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 30.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            fillColor: Colors.white,
            filled: true,
            suffixIcon: const Icon(Icons.filter_list),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}
