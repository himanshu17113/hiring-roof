import 'package:flutter/material.dart';

class PurchaseDialog extends StatelessWidget {
  const PurchaseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 600,
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 45),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Text('We offer a',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center),
                          Text(' Tag for',
                              style: TextStyle(
                                color: Color.fromARGB(255, 136, 45, 152),
                                fontFamily: 'DMSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center),
                          Text(' Urgent',
                              style: TextStyle(
                                //color: Color.fromARGB(255, 136, 45, 152),
                                fontFamily: 'DMSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      Text('Requirement',
                          style: TextStyle(
                            //color: Color.fromARGB(255, 136, 45, 152),
                            fontFamily: 'DMSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(height: 200),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Basic Tag',
                                style: TextStyle(fontFamily: 'DMSans', fontSize: 15, fontWeight: FontWeight.w600))),
                        Row(
                          children: [
                            const Text(
                              '₹50',
                              style: TextStyle(fontFamily: 'DMSans', fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'for 7 Days',
                              style: TextStyle(color: Colors.purple, fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                child: const Text(
                                  'Purchase',
                                  style: TextStyle(color: Colors.white, fontFamily: 'DMSans', fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Basic Tag',
                                style: TextStyle(fontFamily: 'DMSans', fontSize: 15, fontWeight: FontWeight.w600))),
                        Row(
                          children: [
                            const Text(
                              '₹100',
                              style: TextStyle(fontFamily: 'DMSans', fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'for 15 Days',
                              style: TextStyle(color: Colors.purple, fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 76,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                child: const Text(
                                  'Purchase',
                                  style: TextStyle(color: Colors.white, fontFamily: 'DMSans', fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Basic Tag',
                                style: TextStyle(fontFamily: 'DMSans', fontSize: 15, fontWeight: FontWeight.w600))),
                        Row(
                          children: [
                            const Text(
                              '₹200',
                              style: TextStyle(fontFamily: 'DMSans', fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'for 30 Days',
                              style: TextStyle(color: Colors.purple, fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 67,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                child: const Text(
                                  'Purchase',
                                  style: TextStyle(color: Colors.white, fontFamily: 'DMSans', fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
