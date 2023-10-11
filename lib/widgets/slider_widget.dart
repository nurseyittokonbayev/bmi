import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.currentSliderValue,
    this.onChanged,
  });

  final double currentSliderValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'БОЮ',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.black),
              // style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text: '${currentSliderValue.toInt()}',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                const TextSpan(
                    text: 'см',
                    style: TextStyle(
                      fontSize: 18,
                      textBaseline: TextBaseline.alphabetic,
                    ))
              ]),
        ),
        Slider(
            min: 0.0,
            max: 10.0,
            value: currentSliderValue,
            activeColor: Colors.white.withOpacity(0.7),
            thumbColor: const Color(0xfffdb7d1),
            onChanged: onChanged),
      ],
    );
  }
}
