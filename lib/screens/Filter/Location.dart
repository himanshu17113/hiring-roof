import 'package:flutter/material.dart';

class LocationPanel extends StatefulWidget {
  const LocationPanel({Key? key}) : super(key: key);

  @override
  _LocationPanelState createState() => _LocationPanelState();
}

class _LocationPanelState extends State<LocationPanel> {
  Color NearmeBorderColor = Colors.white;
  Color RemotejobBorderColor = Colors.white;
  Color ExactlocationBorderColor = Colors.white;
  Color Within15kmBorderColor = Colors.white;
  Color Within30kmBorderColor = Colors.white;
  Color Within50kmBorderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Location',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: Colors.white,
        ),
      ),
      children: [
        buildRow('Near me', NearmeBorderColor, () {
          setState(() {
            NearmeBorderColor = (NearmeBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Remote job', RemotejobBorderColor, () {
          setState(() {
            RemotejobBorderColor = (RemotejobBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Within 15 km', Within15kmBorderColor, () {
          setState(() {
            Within15kmBorderColor = (Within15kmBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Within 30 km', Within30kmBorderColor, () {
          setState(() {
            Within15kmBorderColor = (Within15kmBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Within 50 km', Within50kmBorderColor, () {
          setState(() {
            Within30kmBorderColor = (Within30kmBorderColor == Colors.white)
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

class LocationPanel extends StatefulWidget {
  const LocationPanel({super.key});

  @override
  _LocationPanelState createState() => _LocationPanelState();
}

class _LocationPanelState extends State<LocationPanel> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Location',
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
              margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Near me',
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
              margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Remote job',
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
              margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Exact locaation',
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
              margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: white),
                color: white,
              ),
            ),
            const Text(
              'Within 15 Km',
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
              'Within 30 km',
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
              'Within 50 km',
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
}
*/
