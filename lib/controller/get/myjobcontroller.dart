import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../model/job.dart';

class MyJobxController extends GetxController {
  var client = http.Client();
  JobModal jobModal = JobModal();
  List<Job> myjobs = [];

  @override
  void onInit() {
    getMyJobs();
    super.onInit();
  }

//  Future<JobModal?>
  getMyJobs() async {
    debugPrint("api hit");
    http.Response response = await http.get(
      Uri.parse(ApiString.myJobs),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
       jobModal = JobModal.fromRawJson(response.body);
       myjobs.addAll(jobModal.jobs!);
       update();
      //     return JobModal.fromRawJson(response.body);
    } else {
      return null;
    }
  }
}
