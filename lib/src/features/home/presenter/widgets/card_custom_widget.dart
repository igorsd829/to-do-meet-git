import 'package:flutter/material.dart';

class CardCustomWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final String hour;

  const CardCustomWidget(
      {required this.color,
      required this.hour,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  State<CardCustomWidget> createState() => _CardCustomWidgetState();
}

class _CardCustomWidgetState extends State<CardCustomWidget> {
  bool? expanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded!;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: expanded! ? 330 : 120,
        width: double.infinity,
        child: Card(
          color: expanded! ? widget.color!.withOpacity(0.1) : Colors.white,
          elevation: 2,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: widget.color),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              widget.title,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Expanded(child: SizedBox()),
                            !expanded!
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      widget.hour,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        !expanded!
                            ? Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                    width: 10,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  !expanded!
                                      ? Text(
                                          '${widget.subtitle.substring(0, 25)}...', //
                                          style: const TextStyle(fontSize: 13),
                                        )
                                      : const SizedBox(),
                                  const Expanded(child: SizedBox()),
                                  !expanded!
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 40,
                                            width: 60,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                return Align(
                                                  widthFactor: 0.5,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Image.network(
                                                      'https://i.pinimg.com/564x/4e/b0/c2/4eb0c2e4912e3dabd00b1c79cd5dac47.jpg',
                                                      height: 35,
                                                      width: 35,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              )
                            : const SizedBox(),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: expanded! ? 220 : 0,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.hour,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 50,
                                        width: 250,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Align(
                                              widthFactor: 1,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  'https://i.pinimg.com/564x/4e/b0/c2/4eb0c2e4912e3dabd00b1c79cd5dac47.jpg',
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.subtitle,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              )
                            ]),
                          ),
                        )
                      ])))),
        ),
      ),
    );
  }
}
