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
    debugPrint(userModal.token!);
    debugPrint("${ApiString.getJobs}?page=$page&limit=4}");
    http.Response response = await http.get(
      Uri.parse("${ApiString.getJobs}?page=$page&limit=4"),
      headers: {"Authorization": userModal.token!,"Content-Type": "application/json"},
    );
    debugPrint(response.request.toString());
        debugPrint(response.headers.toString());
            debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      page++;
      print(response.body.toString());
      jobModal = JobModal.fromRawJson(response.body);
      print(jobModal.msg);
      myjobs.addAll(jobModal.jobs!);
      print(myjobs.toString());
      update();
      //     return JobModal.fromRawJson(response.body);
    } else {
      return null;
    }
  }
}
