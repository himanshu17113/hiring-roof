import 'package:flutter/material.dart';
import 'package:hiring_roof/data/shared_pref.dart';

import '../constant/color.dart';

class CJCard extends StatelessWidget {
  const CJCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      color: const Color.fromRGBO(55, 61, 63, 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
            child: CircleAvatar(
              radius: 18,
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Spline studio",
                          style: TextStyle(fontSize: 15, color: white70),
                        ),
                        Text(
                          "Technical Support Engineer",
                          style: TextStyle(fontSize: 20, color: white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: (double.minPositive)),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.bookmark_outline,
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.pin_drop_outlined,
                      size: 12,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      semanticLabel: "loaction",
                    ),
                    Text(
                      " Brussels",
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    Icon(
                      Icons.schedule,
                      size: 12,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      semanticLabel: "loaction",
                    ),
                    Text(
                      " Full time",
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    Icon(
                      Icons.attach_money,
                      size: 12,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      semanticLabel: "loaction",
                    ),
                    Text(
                      "50-55k",
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    Icon(
                      Icons.work,
                      size: 12,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      semanticLabel: "loaction",
                    ),
                    Text(
                      " Remote",
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      semanticLabel: "loaction",
                    ),
                    Text(
                      " 29 min ago",
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Card(
                        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        shape: StadiumBorder(),
                        color: Color.fromRGBO(64, 64, 64, 0.4),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text(
                            "Short term",
                            style: TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
                            maxLines: 1,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        shape: StadiumBorder(),
                        color: Color.fromRGBO(64, 64, 64, 0.4),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text(
                            "Immediate",
                            style: TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
                            maxLines: 1,
                          ),
                        )),
                  ],
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Job Detail : ',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                      ),
                      TextSpan(
                        text:
                            'laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Loreincididunt. Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Color.fromRGBO(102, 102, 102, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Skills : ',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Color.fromRGBO(90, 90, 90, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                      onTap: () {
                    SharedPref sharedPref = SharedPref();
                    sharedPref.removeUser();
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                      decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: white70),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ));
}
