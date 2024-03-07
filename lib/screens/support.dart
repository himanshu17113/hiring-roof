import 'package:flutter/material.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(20),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(122, 25, 200, 1),
          ),
        ),
        title: const Text('Hiring Roof'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Support',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //    color: white,
                    ),
                  ),
                  TextSpan(
                    text: ' & ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                  ),
                  TextSpan(
                    text: 'Help',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //     color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              " Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. ",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/png/admin.png'))),
            child: Column(
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Chat',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          //    color: white,
                        ),
                      ),
                      TextSpan(
                        text: ' To ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                      ),
                      TextSpan(
                        text: 'Admin',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          //     color: white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  " Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.Mollit in laborum tempor Lorem.",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                  margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(8),
                      gradient: linearGradient),
                  child: const Text("Chat"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
