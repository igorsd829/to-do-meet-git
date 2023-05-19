import 'package:flutter/material.dart';
import 'package:todomeet/src/features/home/presenter/widgets/priority.dart';

class NewTask extends StatefulWidget {
  final void Function()? onPressedClose;
  final void Function()? onPressedSave;

  NewTask(
      {required this.onPressedClose, required this.onPressedSave, super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: 500,
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
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(color: Colors.white),
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
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.transparent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
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
              const SizedBox(
                height: 24,
              ),
              const Divider(
                height: 4,
                color: Colors.white,
              ),
              SizedBox(
                height: 120,
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
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    hintText: 'Add your description',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: widget.onPressedClose,
                      child: const Text('Recurring',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        fixedSize:
                            MaterialStateProperty.all(const Size(100, 60)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: widget.onPressedSave,
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
