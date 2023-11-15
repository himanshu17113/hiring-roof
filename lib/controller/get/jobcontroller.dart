import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../model/job.dart';

class JobxController extends GetxController {
  var client = http.Client();
  double position = 0;
  JobModal jobModal = JobModal();
  List<Job> myjobs = [];
  bool reachedTheEndofMyjob = false;
  bool reachedTheEndofsearch = false;
  List<Job> searchjobs = [];
  String? location;
  String? jobTittle;
  ScrollController scrollController = ScrollController(
      // onAttach: (position) => ,
      );
  ScrollController searchscrollController = ScrollController();
  int page = 1;
  int spage = 1;
  @override
  void onInit() {
    debugPrint(" job length ${myjobs.length}");
    if (myjobs.isEmpty) {
      getMyJobs();
    }

    scrollController.addListener(() {
      position = scrollController.position.pixels;
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !reachedTheEndofMyjob) getMyJobs();
    });
    searchscrollController.addListener(() {
      //  position = scrollController.position.pixels;
      if (searchscrollController.position.pixels == searchscrollController.position.maxScrollExtent && !reachedTheEndofsearch) getmoreSearchedjob();
    });
    super.onInit();
  }

  scroll() => scrollController.jumpTo(position);
//  Future<JobModal?>
  getMyJobs() async {
    debugPrint(" job length ${myjobs.length}");
    debugPrint("api hit");
    debugPrint(userModal.token!);
    debugPrint("${ApiString.getJobs}?page=$page&limit=4}");
    http.Response response = await http.get(
      Uri.parse("${ApiString.getJobs}?page=$page&limit=4"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      if (jobModal.jobs!.isNotEmpty) {
        myjobs.addAll(jobModal.jobs!);

        page++;
        update();
      } else {
        reachedTheEndofMyjob = true;
        update();
      }
    } else {
      return null;
    }
  }

  jobSearch(String? locationx, String? jobTittlex) async {
    if (locationx == location && jobTittlex == jobTittle) {
    } else {
      spage = 0;
    }
    location = locationx;
    jobTittle = jobTittlex;
    debugPrint("${ApiString.search}?page=$spage&limit=4&location=$location&jobTittle=$jobTittle");
    http.Response response = await http.get(
      Uri.parse("${ApiString.search}?page=$spage&limit=4&location=$location&jobTittle=$jobTittle"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      if (jobModal.jobs!.isNotEmpty) {
        searchjobs.addAll(jobModal.jobs!);
        spage++;
        update();
      } else {
        reachedTheEndofsearch = true;
        update();
      }
    } else {
      return null;
    }
  }

  getmoreSearchedjob() async {
    debugPrint("${ApiString.search}?page=$spage&limit=4&location=$location&jobTittle=$jobTittle");
    http.Response response = await http.get(
      Uri.parse("${ApiString.search}?page=$spage&limit=4&location=$location&jobTittle=$jobTittle"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      if (jobModal.jobs!.isNotEmpty) {
        searchjobs = jobModal.jobs!;
        spage++;
        update();
      } else {
        reachedTheEndofsearch = true;
        update();
      }
    } else {
      return null;
    }
  }
}
