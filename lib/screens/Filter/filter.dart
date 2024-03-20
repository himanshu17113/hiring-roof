import 'package:flutter/material.dart';
import 'package:hiring_roof/screens/Filter/DateOfPosting.dart';
import 'package:hiring_roof/screens/Filter/Location.dart';
import 'package:hiring_roof/screens/Filter/Salary.dart';
import 'package:hiring_roof/screens/Filter/employmentType.dart';
import 'package:hiring_roof/screens/Filter/workExperience.dart';
import 'package:hiring_roof/util/constant/color.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              border: Border.all(color: black),
            ),
            child: const YourFilterContent(),
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
              margin: const EdgeInsets.fromLTRB(12, 0, 0, 12),
              //width: double.infinity,
              child: const Text(
                'Filters',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: white, height: 2),
              ),
            ),
            const LocationPanel(),
            const SalaryPanel(),
            const DateFilterPanel(),
            const WrkExpPanel(),
            const EmplpoymentTypePanel(),
          ],
        ),
      ),
    );
  }
}
