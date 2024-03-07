import 'package:flutter/material.dart';

class SalaryPanel extends StatefulWidget {
  const SalaryPanel({Key? key}) : super(key: key);

  @override
  _SalaryPanelState createState() => _SalaryPanelState();
}

class _SalaryPanelState extends State<SalaryPanel> {
  Color hourlyBorderColor = Colors.white;
  Color monthlyBorderColor = Colors.white;
  Color yearlyBorderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Salary',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: Colors.white,
        ),
      ),
      children: [
        StackItem('Hourly', hourlyBorderColor),
        StackItem('Monthly', monthlyBorderColor),
        StackItem('Yearly', yearlyBorderColor),
        const SizedBox(
          height: 16,
        ),
        buildRow('Any', Colors.white),
        buildRow('> 30000k', Colors.white),
        buildRow('> 50000k', Colors.white),
        buildRow('> 80000k', Colors.white),
        buildRow('> 100000k', Colors.white),
      ],
    );
  }

  Widget buildRow(String text, Color borderColor) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 8, 0),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
              color: Colors.white,
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

class StackItem extends StatelessWidget {
  final String title;
  final Color borderColor;

  StackItem(this.title, this.borderColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      width: double.infinity,
      height: 36,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                // Update the parent's state when tapped
                (context as Element).markNeedsBuild();
                // Handle other logic if needed
              },
              child: Container(
                width: 68,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x19ffffff)),
                  color: const Color(0x0cffffff), //black
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                  ),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff666666),
                    ),
                  ),
                ),
              ),
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

class SalaryPanel extends StatefulWidget {
  const SalaryPanel({super.key});

  @override
  _SalaryPanelState createState() => _SalaryPanelState();
}

class _SalaryPanelState extends State<SalaryPanel> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Salary',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 2,
          color: white,
        ),
      ),
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          width: double.infinity,
          height: 36,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 68,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x19ffffff)),
                    color: const Color(0x0cffffff), //black
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      bottomLeft: Radius.circular(2),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Hourly',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 67,
                top: 0,
                child: Container(
                  width: 68,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x19ffffff)),
                    color: const Color(0x0cffffff), //black
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      bottomLeft: Radius.circular(2),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Monthly',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 134,
                top: 0,
                child: Container(
                  width: 68,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x19ffffff)),
                    color: const Color(0x0cffffff), //black
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      bottomLeft: Radius.circular(2),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Yearly',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
          width: double.infinity,
          child: Row(
            children: [
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
                'Any',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: white,
                ),
              ),
            ],
          ),
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
              '> 30000k',
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
              '> 50000k',
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
              '> 80000k',
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
              '> 100000k',
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
