import 'package:flutter/material.dart';

class WrkExpPanel extends StatefulWidget {
  const WrkExpPanel({Key? key}) : super(key: key);

  @override
  _WrkExpPanelState createState() => _WrkExpPanelState();
}

class _WrkExpPanelState extends State<WrkExpPanel> {
  Color AnyExperienceBorderColor = Colors.white;
  Color InternshipBorderColor = Colors.white;
  Color WorkRemotelyBorderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Work Experience',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: Colors.white,
        ),
      ),
      children: [
        buildRow('All time', AnyExperienceBorderColor, () {
          setState(() {
            AnyExperienceBorderColor =
                (AnyExperienceBorderColor == Colors.white)
                    ? Colors.purple
                    : Colors.white;
          });
        }),
        buildRow('Last 24 hours', InternshipBorderColor, () {
          setState(() {
            InternshipBorderColor = (InternshipBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Last 3 days', WorkRemotelyBorderColor, () {
          setState(() {
            WorkRemotelyBorderColor = (WorkRemotelyBorderColor == Colors.white)
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
class WrkExpPanel extends StatefulWidget {
  const WrkExpPanel({super.key});

  @override
  _WrkExpPanelState createState() => _WrkExpPanelState();
}

class _WrkExpPanelState extends State<WrkExpPanel> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Work Experience',
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
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Any experience',
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
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Internship',
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
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Work remotely',
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