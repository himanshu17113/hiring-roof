import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
 // ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../model/job.dart';

class JobxController extends GetxController {
  var client = http.Client();
  JobModal jobModal = JobModal();

//  Future<JobModal?>
  getMyJobs() async {
    debugPrint("api hit");
    http.Response response = await http.get(
      Uri.parse(ApiString.myJobs),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      update();
      //     return JobModal.fromRawJson(response.body);
    } else {
      return null;
    }
  }
}
