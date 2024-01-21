import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/model/application.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApplicationxController extends GetxController {
  static Client client = http.Client();

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
  //int
  int indexOfMyPostedJobs = 1;
  int indexOfSelected = 1;
  int indexOfInterview2 = 1;
  int indexOfInterview = 1;
  int indexOfshortlist = 1;
  int indexOfjobApplications = 1;
  //scroll
  final ScrollController jobApplicationScroll = ScrollController();
  final ScrollController myPostedJobsScroll = ScrollController();
  final ScrollController shortListScroll = ScrollController();
  final ScrollController interveiwScroll = ScrollController();
  final ScrollController interveiw2Scroll = ScrollController();
  final ScrollController selectedCandidatesScroll = ScrollController();

  @override
  void onInit() {
    getMyapplication();
    getMyShortlist();
    getInterveiws();
    getInterveiws2();
    getCandidates();
    jobApplicationScroll.addListener(() {
      // if (jobApplicationScroll.) getMyapplication();
      if (jobApplicationScroll.position.pixels == jobApplicationScroll.position.maxScrollExtent &&
          !endOfjobApplications &&
          userModal.userType != "jobSeeker") {
        getMyapplication();
      }
    });

    // jobApplicationScroll.addListener(() {
    //   if (jobApplicationScroll.position.pixels == jobApplicationScroll.position.maxScrollExtent && !endOfMyPostedJobs && userModal.userType != "jobSeeker") getMyPostedJobs();
    // });
    // jobApplicationScroll.addListener(() {
    //   if (jobApplicationScroll.position.pixels == jobApplicationScroll.position.maxScrollExtent && !endOfMyPostedJobs && userModal.userType != "jobSeeker" && myPostedJobs!.isEmpty) getMyPostedJobs();
    // });
    // jobApplicationScroll.addListener(() {
    //   if (jobApplicationScroll.position.pixels == jobApplicationScroll.position.maxScrollExtent && !endOfMyPostedJobs && userModal.userType != "jobSeeker") getMyPostedJobs();
    // });
    super.onInit();
  }

  // Future<void> getMyPostedJobs() async {
  //   log(userModal.token!);
  //   if (!endOfMyPostedJobs) {
  //     log(("${ApiString.getApplication}$indexOfMyPostedJobs"));
  //     http.Response response = await client.get(Uri.parse("${ApiString.getApplication}$indexOfMyPostedJobs"), headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
  //     log(response.statusCode.toString());
  //     applicationModal = ApplicationModal.fromJson(response.body);
  //     log(applicationModal?.data?.length.toString() ?? "");
  //     if (applicationModal?.data != null) {
  //       if (applicationModal!.data!.isNotEmpty) {
  //         myPostedJobs = applicationModal?.data;
  //         log(applicationModal?.data?.length.toString() ?? "empty");
  //       } else {
  //         endOfMyPostedJobs = true;
  //       }
  //       update();
  //     }
  //   }
  // }
  addToShortlist(final Application application, final int x) {
    jobApplications!.removeAt(x);
    shortList?.add(application);
    update();
  }

  addToInterviewList(Application application, final int x) {
    shortList!.removeAt(x);
    interveiwsList?.add(application);
    update();
  }

  Future<void> getMyapplication() async {
    debugPrint(userModal.token!);
    if (!endOfjobApplications) {
      debugPrint(("${ApiString.getApplication}$indexOfjobApplications"));
      http.Response response = await client.get(Uri.parse("${ApiString.getApplication}$indexOfjobApplications"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            // if (jobApplications!.isEmpty) {
            //   jobApplications = applicationModal!.data!;
            // } else {
            jobApplications?.addAll(applicationModal!.data!);
            //   }
            // for (Application application in jobApplications!) {
            //   if (application.selectedCandidates ?? false) {
            //     shortList!.add(application);
            //     interveiw2List!.add(application);
            //     interveiwsList!.add(application);
            //     selectedCandidatesList!.add(application);
            //   } else if (application.interviews2 ?? false) {
            //     interveiw2List!.add(application);
            //     interveiwsList!.add(application);
            //     shortList!.add(application);
            //   } else if (application.interviews ?? false) {
            //     interveiwsList!.add(application);
            //     shortList!.add(application);
            //   } else if (application.shortlist ?? false) {
            //     shortList!.add(application);
            //   }
            //  }
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
            indexOfjobApplications++;
          } else {
            endOfjobApplications = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getMyShortlist() async {
    debugPrint(userModal.token!);
    if (!endOfshortlist) {
      debugPrint(("${ApiString.getShortlisted}$indexOfshortlist"));
      http.Response response = await client.get(Uri.parse("${ApiString.getshortlist}$indexOfshortlist"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            shortList!.addAll(applicationModal!.data!);
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
          } else {
            endOfshortlist = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getInterveiws() async {
    debugPrint(userModal.token!);
    if (!endOfInterview) {
      debugPrint(("${ApiString.getinterviewslist}$indexOfshortlist"));
      http.Response response = await client.get(Uri.parse("${ApiString.getinterviewslist}$indexOfInterview"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            interveiwsList = applicationModal?.data;
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
          } else {
            endOfInterview = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getInterveiws2() async {
    debugPrint(userModal.token!);
    if (!endOfInterview2) {
      http.Response response = await client.get(Uri.parse("${ApiString.getinterviews2list}$indexOfInterview2"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            interveiw2List = applicationModal?.data;
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
          } else {
            endOfInterview2 = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getCandidates() async {
    if (!endOfSelected) {
      http.Response response = await client.get(Uri.parse("${ApiString.getselectedcandidates}$indexOfSelected"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            selectedCandidatesList = applicationModal?.data;
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
          } else {
            endOfSelected = true;
          }
          update();
        }
      }
    }
  }
}
