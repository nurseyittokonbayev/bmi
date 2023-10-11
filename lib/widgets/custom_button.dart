import 'package:bmi/widgets/class_box.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClassBox(
        height: 40,
        width: 40,
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
