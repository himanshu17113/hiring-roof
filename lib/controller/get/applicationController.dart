import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/model/application.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:http/http.dart' as http;

class ApplicationxController extends GetxController {
  var client = http.Client();

  ApplicationModal? applicationModal;
  //List of data
  List<Application>? myPostedJobs = [];
  List<Application>? jobApplications = [];
  List<Application>? shortList = [];
  List<Application>? interveiwsList = [];
  List<Application>? interveiw2List = [];
  List<Application>? selectedCandidatesList = [];
//endof
  bool endOfMyPostedJobs = false;
  bool endOfSelected = false;
  bool endOfInterview2 = false;
  bool endOfInterview = false;
  bool endOfshortlist = false;
  bool endOfjobApplications = false;
  //scroll
 final ScrollController jobApplicationScroll = ScrollController();
 final ScrollController myPostedJobsScroll = ScrollController();
 final ScrollController shortListScroll = ScrollController();
 final ScrollController interveiwScroll = ScrollController();
 final ScrollController interveiw2Scroll = ScrollController();
 final ScrollController selectedCandidatesScroll = ScrollController();

  @override
  void onInit() {
    jobApplicationScroll.addListener(() {
      if (jobApplicationScroll.position.pixels == jobApplicationScroll.position.maxScrollExtent && !endOfMyPostedJobs && userModal.userType != "jobSeeker") getMyPostedJobs();
    });
    super.onInit();
  }

  Future<void> getMyPostedJobs() async {
    if (!endOfMyPostedJobs) {
      http.Response response = await client.post(Uri.parse(ApiString.getApplication), headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      applicationModal = ApplicationModal.fromJson(response.body);
      if (applicationModal?.data != null && applicationModal!.data!.isNotEmpty) {
        myPostedJobs = applicationModal?.data;
      } else {
        endOfMyPostedJobs = true;
      }
      update();
    }
  }
}
