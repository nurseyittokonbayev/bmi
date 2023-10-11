import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Center(
          child: Text(
        'ЭСЕПТЕ',
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}
