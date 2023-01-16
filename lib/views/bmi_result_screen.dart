import 'package:bmi_flutter_test/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:bmi_flutter_test/views/bmi_data_screen.dart';

class bmi_result_screen extends StatelessWidget {
  const bmi_result_screen({
    Key? key,
    required this.bmi,
  }) : super(key: key);
  final double bmi;

  String determineBmiCategory(double bmivalue) {
    String category = "";
    if (bmivalue < 18.5) {
      category = underweight;
    } else if (bmivalue < 25) {
      category = Normal;
    } else if (bmivalue < 30) {
      category = Overweight;
    } else if (bmivalue >= 30) {
      category = Obese;
    }
    return category;
  }

  String GetHealRiskDescription(String CategoryName) {
    String desc = "";
    switch (CategoryName) {
      case underweight:
        desc =
            "being underweight can be a sign of some underlying condition or disease such as anorexia nervosa, which comes with its own set of risks. Consult your doctor immediately!";
        break;
      case Normal:
        desc = "Good, Low Risk (Healthy Range)";
        break;
      case Obese:
        desc =
            "Being obese can cause some serious problems, consult a doctor immediately!";
        break;
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        const Expanded(
            child: Center(
          child: Text(
            "Hasil Perhitungan",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )),
        Expanded(
            flex: 5,
            child: BMICard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      determineBmiCategory(bmi),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      GetHealRiskDescription(determineBmiCategory(bmi)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 80,
            color: const Color(0xffFF4D4D),
            child: const Center(
                child: Text(
              "Hitung Ulang",
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
