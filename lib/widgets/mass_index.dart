import 'package:bmi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MassIndex extends StatelessWidget {
  const MassIndex({
    super.key,
    required this.text,
    required this.value,
    required this.remove,
    required this.add,
  });

  final String text;
  final int value;
  final void Function(int) remove;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomButton(
              onTap: () => remove(value - 1),
              icon: Icons.remove,
            ),
            const SizedBox(
              width: 10,
            ),
            MyCustomButton(
              onTap: () => add(value + 1),
              icon: Icons.add,
            ),
          ],
        )
      ],
    );
  }
}
