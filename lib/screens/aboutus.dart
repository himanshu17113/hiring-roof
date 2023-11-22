import 'package:flutter/material.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'About ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: white,
                ),
              ),
              TextSpan(
                text: 'Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
              ),
            ],
          ),
        ),
      ),
      body: const Text(
          "Thousands of jobs in the computer, engineering and technology sectors are waiting for you Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt. ."),
    );
  }
}
