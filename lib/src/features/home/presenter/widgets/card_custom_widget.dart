import 'package:flutter/material.dart';

class CardCustomWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, color: color),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          hour,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 13),
                      ),
                      const Expanded(child: SizedBox()),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          width: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Align(
                                widthFactor: 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
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
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
