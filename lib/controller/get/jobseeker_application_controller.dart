import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/model/application.dart';
import 'package:hiring_roof/model/job.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyJobsxController extends GetxController {
  static Client client = http.Client();

  ApplicationModal? applicationModal;
  //List of data
  List<Job>? saved = [];
  List<Application>? applied = [];
  List<Application>? shortList = [];
  List<Application>? interveiwsList = [];
  List<Application>? interveiw2List = [];
  List<Application>? results = [];
//endof
  bool endOfSaved = false;
  bool endOfApplied = false;
  bool endOfInterview2 = false;
  bool endOfInterview = false;
  bool endOfshortlist = false;
  bool endOfResults = false;
  //int
  int indexOfSaved = 1;
  int indexOfApplied = 1;
  int indexOfInterview2 = 1;
  int indexOfInterview = 1;
  int indexOfShortlist = 1;
  int indexOfResults = 1;
  //scroll
  final ScrollController savedScroll = ScrollController();
  final ScrollController appliedJobsScroll = ScrollController();
  final ScrollController shortListScroll = ScrollController();
  final ScrollController interveiwScroll = ScrollController();
  final ScrollController interveiw2Scroll = ScrollController();
  final ScrollController resultScroll = ScrollController();

  @override
  void onInit() async {
    await getSaved();
    getApplied();
    getMyShortlist();
    getInterveiws();
    getInterveiws2();
    getResults();
    // jobApplicationScroll.addListener(() {
    //   // if (jobApplicationScroll.) getMyapplication();
    //   if (jobApplicationScroll.position.pixels == jobApplicationScroll.position.maxScrollExtent &&
    //       !endOfjobApplications &&
    //       userModal.userType != "jobSeeker") {
    //     getMyapplication();
    //   }
    // });

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

  Future<void> getSaved() async {
    if (!endOfSaved) {
      debugPrint((ApiString.getsave));
      final http.Response response = await client
          .get(Uri.parse(ApiString.getsave), headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        log(response.body.toString());
        final JobModal jobModal = JobModal.fromjsonwithuserId(jsonDecode(response.body));
        if (jobModal.jobs != null) {
          if (jobModal.jobs!.isNotEmpty) {
            saved?.addAll(jobModal.jobs!);
            debugPrint(jobModal.jobs!.length.toString());
            indexOfSaved++;
          } else {
            endOfSaved = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getApplied() async {
    if (!endOfApplied) {
      debugPrint(("${ApiString.getApplications}$indexOfApplied"));
      final http.Response response = await client.get(Uri.parse("${ApiString.getApplications}$indexOfApplied"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            applied?.addAll(applicationModal!.data!);
            indexOfApplied++;
          } else {
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");

            endOfApplied = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getMyShortlist() async {
    if (!endOfshortlist) {
      debugPrint(("${ApiString.getShortlisted}$indexOfShortlist"));
      final http.Response response = await client.get(Uri.parse("${ApiString.getshortlist}$indexOfShortlist"),
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
      debugPrint(("${ApiString.getCandidateinterviews}$indexOfInterview"));
      final http.Response response = await client.get(Uri.parse("${ApiString.getCandidateinterviews}$indexOfInterview"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            interveiwsList?.addAll(applicationModal!.data!);
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
      final http.Response response = await client.get(Uri.parse("${ApiString.get2Candidateinterviews}$indexOfInterview2"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            interveiw2List?.addAll(applicationModal!.data!);
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
          } else {
            endOfInterview2 = true;
          }
          update();
        }
      }
    }
  }

  Future<void> getResults() async {
    if (!endOfResults) {
      final http.Response response = await client.get(Uri.parse("${ApiString.getselectedCompany}$indexOfResults"),
          headers: {"Authorization": userModal.token!, "Content-Type": "application/json"});
      if (response.statusCode == 200) {
        applicationModal = ApplicationModal.fromJson(response.body);
        if (applicationModal?.data != null) {
          if (applicationModal!.data!.isNotEmpty) {
            results?.addAll(applicationModal!.data!);
            debugPrint(applicationModal?.data?.length.toString() ?? "empty");
          } else {
            endOfResults = true;
          }
          update();
        }
      }
    }
  }
}
