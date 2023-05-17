import 'package:flutter/material.dart';

class Priority extends StatefulWidget {
  final String title;
  final void Function(bool?)? onChanged;
  const Priority({required this.onChanged, required this.title, super.key});

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: const OvalBorder(),
          side: const BorderSide(width: 1, color: Colors.white),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
