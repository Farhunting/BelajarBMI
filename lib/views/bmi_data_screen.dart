import 'package:flutter/material.dart';

import 'package:bmi_flutter_test/constant/constant.dart';
import 'package:bmi_flutter_test/views/bmi_result_screen.dart';

class bmi_data_screen extends StatefulWidget {
  const bmi_data_screen({super.key});

  @override
  State<bmi_data_screen> createState() => _bmi_data_screenState();
}

class _bmi_data_screenState extends State<bmi_data_screen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  double calculateBMI() {
    double Heightinmeter = height / 100;

    final bmi = weight / (Heightinmeter * Heightinmeter);

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1D1D),
      appBar: AppBar(
        title: const Text("Calculator BMI"),
      ),
      body: Column(children: [
        Expanded(
          child: Row(children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                gender = "male";
                setState(() {});
              },
              child: BMICard(
                borderColor: (gender == "male") ? Colors.white : primarycolor,
                child: const GenderIconText(tittle: "Male", icon: Icons.male),
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "female";
                  setState(() {});
                },
                child: BMICard(
                  borderColor:
                      (gender == "female") ? Colors.white : primarycolor,
                  child: const GenderIconText(
                      tittle: "Female", icon: Icons.female),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
            child: Container(
          child: BMICard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height",
                  style: LabelTextStyle!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$height",
                      style: Numberstyle,
                    ),
                    Text(
                      "Cm",
                      style: LabelTextStyle,
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 80,
                  max: 250,
                  thumbColor: Colors.red,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        )),
        Expanded(
            child: Container(
          child: Row(
            children: [
              Expanded(
                  child: BMICard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: LabelTextStyle,
                    ),
                    Text(
                      "$weight",
                      style: Numberstyle,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            weight += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff1C1C1C),
                          constraints: const BoxConstraints.tightFor(
                            width: 53,
                            height: 53,
                          ),
                        ),
                        const SizedBox(width: 10),
                        RawMaterialButton(
                          onPressed: () {
                            weight -= 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff1C1C1C),
                          constraints: const BoxConstraints.tightFor(
                            width: 53,
                            height: 53,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: BMICard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: LabelTextStyle,
                    ),
                    Text(
                      "$age",
                      style: Numberstyle,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            age += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff1C1C1C),
                          constraints: const BoxConstraints.tightFor(
                            width: 53,
                            height: 53,
                          ),
                        ),
                        const SizedBox(width: 10),
                        RawMaterialButton(
                          onPressed: () {
                            age -= 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff1C1C1C),
                          constraints: const BoxConstraints.tightFor(
                            width: 53,
                            height: 53,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        )),
        GestureDetector(
          onTap: () {
            print(calculateBMI());
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return bmi_result_screen(bmi: calculateBMI());
              }),
            );
          },
          // Gesture yang di gunakan sebagai cara dan Navigasi
          // yang di gunakan untuk melanjutkan halaman selanjutnya
          child: Container(
            height: 80,
            color: const Color(0xffFF4D4D),
            child: const Center(
                child: Text(
              "Hitung BMI",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        )
      ]),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
    this.borderColor = primarycolor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xff2C2C2C),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor!)),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.tittle,
    required this.icon,
  }) : super(key: key);

  final String tittle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        Text(tittle, style: LabelTextStyle),
      ],
    );
  }
}
