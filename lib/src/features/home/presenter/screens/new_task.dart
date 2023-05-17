import 'package:flutter/material.dart';
import 'package:todomeet/src/features/home/presenter/widgets/priority.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 30,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      hintText: 'What do you need to do?',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.transparent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
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
              const Divider(
                height: 4,
                color: Colors.white,
              ),
              SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Priority',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Priority(title: 'High !!!', onChanged: (p0) {}),
                        Priority(title: 'Medium !!', onChanged: (p0) {}),
                        Priority(title: 'Low !', onChanged: (p0) {}),
                        Priority(title: 'None', onChanged: (p0) {}),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 4,
                color: Colors.white,
              ),
              // Container(
              //   height: 50,
              //   width: double.infinity,
              //   color: Colors.transparent,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         'invite',
              //         style: TextStyle(color: Colors.white, fontSize: 15),
              //       ),
              //       ListView.builder(
              //         itemCount: 5,
              //         itemBuilder: (context, index) {
              //           return Text('data');
              //         },
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Priority',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Priority(title: 'High !!!', onChanged: (p0) {}),
                        Priority(title: 'Medium !!', onChanged: (p0) {}),
                        Priority(title: 'Low !', onChanged: (p0) {}),
                        Priority(title: 'None', onChanged: (p0) {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
