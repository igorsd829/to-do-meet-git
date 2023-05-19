import 'package:flutter/material.dart';
import '../../data/list.dart';
import '../../data/models/to_do_task.dart';
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
  DraggableScrollableController dragController =
      DraggableScrollableController();

  List<Todo> tasket = [
    Todo(
      title: 'Primeira guerra',
      subtitle:
          'A Primeira Guerra Mundial foi um conflito bélico global centrado na Europa, que começou em 28 de julho de 1914 e durou até 11 de novembro de 1918. A guerra envolveu as grandes potências de todo o mundo, que se organizaram em duas alianças opostas: os Aliados e os Impérios Centrais.',
      category: '',
      priotity: Colors.red,
      isExpanded: false,
    ),
    Todo(
      title: 'Vamos para marte',
      subtitle:
          'Elon Reeve Musk é um empreendedor, empresário e filantropo sul-africano-canadense, naturalizado norte-americano. Ele é o fundador, diretor executivo e diretor técnico da SpaceX; CEO da Tesla, Inc.; vice-presidente da OpenAI, fundador e CEO da Neuralink; cofundador, presidente da SolarCity e proprietário do Twitter.',
      category: '',
      priotity: Colors.orange,
      isExpanded: false,
    ),
  ];

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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '18 jun 2019, tuesday',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
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
                      itemCount: listaTask.length,
                      itemBuilder: (context, index) {
                        return CardCustomWidget(
                          title: listaTask[index].title,
                          subtitle: listaTask[index].subtitle,
                          color: listaTask[index].priotity,
                          hour: '09:00 am',
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.blue),
            child: TextButton.icon(
                icon: const Icon(
                  Icons.add_circle,
                  size: 50,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add new task',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.blue,
                      isDismissible: true,
                      enableDrag: true,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: NewTask(
                            onPressedSave: () {},
                            onPressedClose: () {},
                          ),
                        );
                      });
                })));
  }
}
