import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Today',
                  style: TextStyle(fontSize: 40),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.calendar_today_outlined))
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff2471ff),
                  borderRadius: BorderRadius.circular(30)),
              height: 50,
              width: double.infinity,
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(
                      backgroundColor: Colors.white,
                      elevation: 0.5,
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      label: Text('Undone'),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text('Project daily stand-up'),
                      subtitle: Text('at the conference center'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
