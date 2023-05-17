import 'package:flutter/material.dart';
import '../widgets/card_custom_widget.dart';
import 'new_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> opacityAnimation;
  int i = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    opacityAnimation = CurvedAnimation(
        parent: Tween<double>(begin: 1, end: 0).animate(_animationController),
        curve: Curves.easeInOutExpo);
  }

  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                    onPressed: () {
                      setState(() {
                        open = !open;
                      });
                    },
                    icon: const Icon(Icons.calendar_today_outlined))
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '18 jun 2019, tuesday',
                style: TextStyle(fontSize: 14),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: const LinearGradient(
            //           begin: Alignment.centerLeft,
            //           end: Alignment.centerRight,
            //           colors: <Color>[
            //             Color.fromARGB(255, 122, 185, 248),
            //             Color(0xff49A4FD),
            //             Color(0xff2471ff)
            //           ]),
            //       borderRadius: BorderRadius.circular(30)),
            //   height: 50,
            //   width: double.infinity,
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: const [
            //         Icon(Icons.search, color: Colors.white),
            //         Text('Search', style: TextStyle(color: Colors.white))
            //       ]),
            // ),
            SizedBox(
              height: 50,
              width: double.infinity,
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CardCustomWidget(
                          title: 'Project daily stand-up',
                          subtitle: 'At the conference center',
                          color: Colors.cyan,
                          hour: '09:00 am',
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedContainer(
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          duration: const Duration(milliseconds: 200),
          height: open ? 600 : 70,
          width: double.infinity,
          child: TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                transitionAnimationController: _animationController,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                context: context,
                builder: (context) {
                  return const NewTask();
                },
              );
            },
            icon: const Icon(
              Icons.add_circle,
              size: 50,
              color: Colors.white,
            ),
            label: const Text(
              'Add new task',
              style: TextStyle(color: Colors.white),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
