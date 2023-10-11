import 'dart:math';

import 'package:bmi/widgets/alert_dialog.dart';
import 'package:bmi/widgets/calculate_button.dart';
import 'package:bmi/widgets/class_box.dart';
import 'package:bmi/widgets/gender_widget.dart';
import 'package:bmi/widgets/mass_index.dart';
import 'package:bmi/widgets/slider_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 0;
  bool isFemale = false;
  int weight = 60;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bmi.jpg'), fit: BoxFit.cover,
            // opacity: 0.6,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ClassBox(
                  height: 40,
                  width: 350,
                  child: Center(
                    child: Text(
                      'Дене салмагынын индекси',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemale = false;
                        });
                      },
                      child: GenderWidget(
                        icon: Icons.male,
                        text: 'ЭРКЕК',
                        isFemale: !isFemale,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemale = true;
                        });
                      },
                      child: GenderWidget(
                        icon: Icons.female,
                        text: 'АЯЛ',
                        isFemale: isFemale,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SliderWidget(
                  currentSliderValue: height,
                  onChanged: (double value) {
                    setState(() {
                      height = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClassBox(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: MassIndex(
                          text: 'САЛМАГЫ',
                          value: weight,
                          remove: (value) {
                            setState(() {
                              weight = value;
                            });
                          },
                          add: (value) {
                            setState(() {
                              weight = value;
                            });
                          },
                        ),
                      ),
                    ),
                    ClassBox(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: MassIndex(
                          text: 'ЖАШЫ',
                          value: age,
                          remove: (value) {
                            setState(() {
                              age = value;
                            });
                          },
                          add: (value) {
                            setState(() {
                              age = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ClassBox(
                  width: 200,
                  height: 100,
                  child: CalculateButton(
                    onTap: () {
                      final result = weight / pow(height, 2);
                      if (result < 18.5) {
                        showMyDialog(
                            context: context,
                            text:
                                'Сиздин салмагыныз нормадан аз. Туура тамактаныныз');
                      } else if (result >= 18.5 && result <= 24.9) {
                        showMyDialog(
                            context: context,
                            text: 'Сиздин салмагыныз норма. Азаматсыз');
                      } else if (result > 24.9) {
                        showMyDialog(
                            context: context,
                            text:
                                'Сиздин салмагыныз нормадан коп. Туура тамактаныныз');
                      } else {
                        showMyDialog(
                            context: context,
                            text:
                                'Маалымат алууда каталар кетти, кайрадан кайталаныз');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
