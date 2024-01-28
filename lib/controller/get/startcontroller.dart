import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/apistring.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../model/job.dart';

class StartxController extends GetxController {
  static Client client = http.Client();
  JobModal jobModal = JobModal();   
  List<Job> myjobs = [];
  ScrollController scrollController = ScrollController();
  int page = 1;
  @override
  void onInit() {
    debugPrint(" job length ${myjobs.length}");
    if (myjobs.isEmpty) {
      getMyJobs();
    }

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) getMyJobs();
    });

    super.onInit();
  }

//  Future<JobModal?>
  getMyJobs() async {
    debugPrint(" job length ${myjobs.length}");
    debugPrint("api hit");
    http.Response response = await http.get(
      Uri.parse("${ApiString.allJobs}?page=$page"),
      headers: {"Content-Type": "application/json"},
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      page++;
      jobModal = JobModal.fromRawJson(response.body);
      debugPrint(jobModal.jobs!.length.toString());
      myjobs.addAll(jobModal.jobs!);
      update();
      //     return JobModal.fromRawJson(response.body);
    } else {
      return null;
    }
  }
}
