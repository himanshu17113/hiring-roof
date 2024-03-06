import 'package:flutter/material.dart';
import 'package:hiring_roof/screens/Filter/DateOfPosting.dart';
import 'package:hiring_roof/screens/Filter/employmentType.dart';
import 'package:hiring_roof/screens/Filter/workExperience.dart';
import 'package:hiring_roof/util/constant/color.dart';

class filterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              border: Border.all(color: black),
            ),
            child: YourFilterContent(),
          ),
        ),
      ),
    );
  }
}

class YourFilterContent extends StatelessWidget {
  const YourFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 0, 12),
              //width: double.infinity,
              child: const Text(
                'Filters',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: white,
                    height: 2),
              ),
            ),

            //////////////////////////////////////////////////////LOCATION///////////////////////////////////////////////////////////////////

            Container(
              width: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 12),
                      child: const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: white,
                        ),
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
                          'Exact Location',
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
                          'Within 15 km',
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
                  ]),
            ),

            ////////////////////////////////////////////////////SALARY///////////////////////////////////////////////////////

            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: const Text(
                      'Salary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 2,
                        color: white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
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
                    height: 12,
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
              ),
            ),
            const SizedBox(
              height: 16,
            ),
//////////////////////////////////////////////DATE OF POSTING
            DateFilterPanel(),

            WrkExpPanel(),

            EmplpoymentType(),
          ],
        ),
      ),
    );
  }
}
