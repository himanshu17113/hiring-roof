import 'package:flutter/material.dart';

class DateFilterPanel extends StatefulWidget {
  const DateFilterPanel({Key? key}) : super(key: key);

  @override
  _DateFilterPanelState createState() => _DateFilterPanelState();
}

class _DateFilterPanelState extends State<DateFilterPanel> {
  Color allTimeBorderColor = Colors.white;
  Color last24HoursBorderColor = Colors.white;
  Color last3DaysBorderColor = Colors.white;
  Color last7DaysBorderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Date of posting',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: Colors.white,
        ),
      ),
      children: [
        buildRow('All time', allTimeBorderColor, () {
          setState(() {
            allTimeBorderColor = (allTimeBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Last 24 hours', last24HoursBorderColor, () {
          setState(() {
            last24HoursBorderColor = (last24HoursBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Last 3 days', last3DaysBorderColor, () {
          setState(() {
            last3DaysBorderColor = (last3DaysBorderColor == Colors.white)
                ? Colors.purple
                : Colors.white;
          });
        }),
        buildRow('Last 7 days', last7DaysBorderColor, () {
          setState(() {
            last7DaysBorderColor = (last7DaysBorderColor == Colors.white)
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

class DateFilterPanel extends StatefulWidget {
  const DateFilterPanel({super.key});

  @override
  _DateFilterPanelState createState() => _DateFilterPanelState();
}

class _DateFilterPanelState extends State<DateFilterPanel> {
  Color borderColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Date of posting',
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
            InkWell(
              onTap: () {
                setState(() {
                  borderColor = (borderColor == Colors.white)
                      ? Colors.purple
                      : Colors.white;
                });
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor, width: 6),
                  //border: Border.all(color: white),
                  color: white,
                ),
              ),
            ),
            const Text(
              'All time',
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
            InkWell(
              onTap: () {
                setState(() {
                  borderColor = (borderColor == Colors.white)
                      ? Colors.purple
                      : Colors.white;
                });
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor, width: 6),
                  color: white,
                ),
              ),
            ),
            const Text(
              'Last 24 hours',
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
              'Last 3 days',
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
              'Last 7 days',
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
