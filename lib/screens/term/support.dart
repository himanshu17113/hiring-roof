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
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 6),
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        'assets/png/admin.png',
                      ))),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 70),
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Chat',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              //    color: white,
                            ),
                          ),
                          TextSpan(
                            text: ' To ',
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                          ),
                          TextSpan(
                            text: 'Admin',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              //     color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Text(
                        " Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.Mollit in laborum tempor Lorem.",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 45,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                      margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 55),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                          gradient: linearGradient),
                      child: const Text("Chat"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
