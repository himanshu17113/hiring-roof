import 'package:flutter/widgets.dart';
import 'package:hiring_roof/util/widgets/jcard.dart';

class MyPostedJobs extends StatelessWidget {
  const MyPostedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(primary: true, itemCount: 9, itemBuilder: (BuildContext context, int index) => const CJCard());
  }
}
