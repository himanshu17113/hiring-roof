import 'package:flutter/material.dart';

class EmplpoymentTypePanel extends StatefulWidget {
  const EmplpoymentTypePanel({Key? key}) : super(key: key);

  @override
  _EmplpoymentTypePanelState createState() => _EmplpoymentTypePanelState();
}

class _EmplpoymentTypePanelState extends State<EmplpoymentTypePanel> {
  Color FulltimeBorderColor = Colors.white;
  Color TemporaryBorderColor = Colors.white;
  Color ParttimeBorderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Type of employment',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: Colors.white,
        ),
      ),
      children: [
        buildRow('Full time', FulltimeBorderColor, () {
          setState(() {
            FulltimeBorderColor = (FulltimeBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Temporary', TemporaryBorderColor, () {
          setState(() {
            TemporaryBorderColor = (TemporaryBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Part-time', ParttimeBorderColor, () {
          setState(() {
            ParttimeBorderColor = (ParttimeBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
      ],
    );
  }

  Widget buildRow(String text, Color borderColor, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
      width: double.infinity,
      child: Row(
        children: [
          InkWell(
            enableFeedback: false,
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor, width: 6),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:hiring_roof/util/constant/color.dart';

// ignore: camel_case_types
class EmplpoymentType extends StatefulWidget {
  const EmplpoymentType({super.key});

  @override
  _EmplpoymentTypeState createState() => _EmplpoymentTypeState();
}

class _EmplpoymentTypeState extends State<EmplpoymentType> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Type of employment',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: white,
        ),
      ),
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
          width: double.infinity,
          child: Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Full-time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: white,
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
          width: double.infinity,
          child: Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Temporary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: white,
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
          width: double.infinity,
          child: Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Part-time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: white,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}*/
