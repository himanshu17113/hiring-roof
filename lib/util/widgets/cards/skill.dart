import 'package:flutter/material.dart';

import 'package:hiring_roof/controller/http/httpjob.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Skill extends StatefulWidget {
  final List<String> skills;
  final String id;
  const Skill({super.key, required this.skills, required this.id});

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  List<String> skillset = [];
  @override
  void initState() {
    skillset = List.filled(widget.skills.length, 'none');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          centerTitle: false,
          leading: const SizedBox.shrink(),
          title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Choose Your skills Level',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              'Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint ',
              softWrap: true,
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ]),
          actions: [IconButton(onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back_ios))],
        ),
        body: Column(
            children: List.generate(widget.skills.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.skills.elementAt(index)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => setState(() => skillset[index] = 'Begginner'),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: skillset[index] != 'Begginner' ? Colors.white30 : Colors.transparent)),
                          color: skillset[index] != 'Begginner' ? Colors.transparent : const Color.fromRGBO(47, 38, 55, 1)),
                      child: Text(
                        'Beginner',
                        style: TextStyle(color: skillset[index] != 'Begginner' ? Colors.white30 : purple),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => skillset[index] = 'Intermediate'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: skillset[index] != 'Intermediate' ? Colors.white30 : Colors.transparent)),
                          color: skillset[index] != 'Intermediate' ? Colors.transparent : const Color.fromRGBO(47, 38, 55, 1)),
                      child: Text(
                        'Intermediate',
                        style: TextStyle(color: skillset[index] != 'Intermediate' ? Colors.white30 : purple),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => skillset[index] = 'Experienced'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: skillset[index] != 'Experienced' ? Colors.white30 : Colors.transparent)),
                          color: skillset[index] != 'Experienced' ? Colors.transparent : const Color.fromRGBO(47, 38, 55, 1)),
                      child: Text(
                        'Experienced',
                        style: TextStyle(color: skillset[index] != 'Experienced' ? Colors.white30 : purple),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        })),
        bottomNavigationBar: GestureDetector(
          onTap: () => Cardconnect.applyJob(widget.id).then((value) => Navigator.pop(context, value)),
          child: Container(
            height: 45,
            alignment: Alignment.center,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
            margin: const EdgeInsets.fromLTRB(35, 0, 35, 50),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
            child: const Text(
              "Submit",
              style: TextStyle(color: white70),
            ),
          ),
        ),
      ),
    );
  }
}
