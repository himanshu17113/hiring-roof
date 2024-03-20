import 'package:flutter/material.dart';

class LocationPanel extends StatefulWidget {
  const LocationPanel({Key? key}) : super(key: key);

  @override
  _LocationPanelState createState() => _LocationPanelState();
}

class _LocationPanelState extends State<LocationPanel> {
  Color nearmeBorderColor = Colors.white;
  Color remotejobBorderColor = Colors.white;
  Color exactlocationBorderColor = Colors.white;
  Color within15kmBorderColor = Colors.white;
  Color within30kmBorderColor = Colors.white;
  Color within50kmBorderColor = Colors.white;

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
        buildRow('Near me', nearmeBorderColor, () {
          setState(() {
            resetColors();
            nearmeBorderColor = (nearmeBorderColor == Colors.white) ? Colors.purple : Colors.white;
          });
        }),
        buildRow('Exact location', exactlocationBorderColor, () {
          setState(() {
            resetColors();
            exactlocationBorderColor = (exactlocationBorderColor == Colors.white) ? Colors.purple : Colors.white;
          });
        }),
        buildRow('Within 15 km', within15kmBorderColor, () {
          setState(() {
            resetColors();
            within15kmBorderColor = (within15kmBorderColor == Colors.white) ? Colors.purple : Colors.white;
          });
        }),
        buildRow('Within 30 km', within30kmBorderColor, () {
          setState(() {
            resetColors();
            within30kmBorderColor = (within30kmBorderColor == Colors.white) ? Colors.purple : Colors.white;
          });
        }),
        buildRow('Within 50 km', within50kmBorderColor, () {
          setState(() {
            resetColors();
            within50kmBorderColor = (within50kmBorderColor == Colors.white) ? Colors.purple : Colors.white;
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

  void resetColors() {
    setState(() {
      nearmeBorderColor = Colors.white;
      remotejobBorderColor = Colors.white;
      exactlocationBorderColor = Colors.white;
      within15kmBorderColor = Colors.white;
      within30kmBorderColor = Colors.white;
      within50kmBorderColor = Colors.white;
    });
  }
}
