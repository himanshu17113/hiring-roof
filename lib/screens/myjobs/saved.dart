import 'package:flutter/widgets.dart';
import 'package:hiring_roof/util/widgets/cards/jcard.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(primary: true, itemCount: 12, itemBuilder: (BuildContext context, int index) => const CJCard());
  }
}
