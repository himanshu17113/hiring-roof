import 'package:flutter/material.dart';
import 'package:hiring_roof/model/job.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../util/apistring.dart';

class StartProvidr extends ChangeNotifier {
  var client = http.Client();
  JobModal jobModal = JobModal();
  JobModal get getjobModal => jobModal;
  List<Job> myjobs = [];
  ScrollController scrollController = ScrollController();
  int page = 1;

  void onInit() {
    getMyJobs();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) getMyJobs();
    });
  }

//  Future<JobModal?>
  getMyJobs() async {
    debugPrint("api hit");
    http.Response response = await http.get(
      Uri.parse(ApiString.allJobs),
      headers: {"Content-Type": "application/json"},
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      myjobs.addAll(jobModal.jobs!);
      notifyListeners();
      //     return JobModal.fromRawJson(response.body);
    } else {
      return null;
    }
  }
}
