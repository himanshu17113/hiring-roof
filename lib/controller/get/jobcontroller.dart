import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../model/job.dart';

class JobxController extends GetxController {
  static Client client = http.Client();
  // ApiString apiString = ApiString();
  double position = 0;
  JobModal jobModal = JobModal();
  List<Job> myjobs = [];
  bool reachedTheEndofMyjob = false;
  bool reachedTheEndofsearch = false;
  bool isSearching = false;
  final int searchlimit = 5;
  //  List<int> filter = [];
  //  Map<String, bool> categories = {
  //   "Graphics": false,
  //   "3d Artists": false,
  //   "Animation": false,
  //   "Web Designing": false,
  //   "UI&UX Jobs": false
  // };
  List<bool> selectedCategories = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<Job> searchjobs = [];
  String? location;
  String? jobTittle;
  List<Job> savedjobs = [];
  ScrollController scrollController = ScrollController(
      // onAttach: (position) => ,
      );
  ScrollController searchscrollController = ScrollController();
  int page = 1;
  int spage = 1;
  @override
  void onInit() {
    debugPrint(" job length ${myjobs.length}");
    if (myjobs.isEmpty && userModal.token != null
        // && userModal.userType == "jobSeeker"
        ) {
      getMyJobs();
    }

    scrollController.addListener(() {
      position = scrollController.position.pixels;
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !reachedTheEndofMyjob
          // &&  userModal.userType == "jobSeeker"
          ) getMyJobs();
    });
    searchscrollController.addListener(() {
      //  position = scrollController.position.pixels;
      if (searchscrollController.position.pixels == searchscrollController.position.maxScrollExtent &&
          !reachedTheEndofsearch &&
          !isSearching) {
        getmoreSearchedjob();
      }
    });
    super.onInit();
  }

  scroll() => scrollController.jumpTo(position);
//  Future<JobModal?>
  getMyJobs() async {
    debugPrint(" job length ${myjobs.length}");

    debugPrint(userModal.token ?? token);
    debugPrint("${ApiString.getJobs}?page=$page&limit=4}");
    http.Response response = await client.get(
      Uri.parse("${ApiString.getJobs}?page=$page&limit=4"),
      headers: {"Authorization": userModal.token ?? token, "Content-Type": "application/json"},
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

  getCategories() async {
    //    http.Response response =
    await client.get(
      Uri.parse(
          "${ApiString.allJobs}?page=$spage&limit=$searchlimit&location=$location&workType=&jobType=&timePeriod=&payType=monthly&pay=&availability=&dateOfPosting=&jobTittle=$jobTittle"),
      headers: {"Authorization": userModal.token ?? token, "Content-Type": "application/json"},
    );
  }

  jobSearch(String? locationx, String? jobTittlex) async {
    isSearching = true;
    if (locationx == location && jobTittlex == jobTittle) {
    } else {
      spage = 0;
    }
    location = locationx;
    jobTittle = jobTittlex;
    debugPrint("${ApiString.getJobs}?page=$spage&limit=$searchlimit&location=$location&jobTittle=$jobTittle");
    http.Response response = await client.get(
      Uri.parse("${ApiString.getJobs}?page=$spage&limit=$searchlimit&jobTittle=$jobTittle"),
      //location=$location&workType=&jobType=&timePeriod=&payType=monthly&pay=&availability=&dateOfPosting=&

      headers: {"Authorization": userModal.token ?? token, "Content-Type": "application/json"},
    );

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      if (jobModal.jobs!.isNotEmpty) {
        searchjobs = jobModal.jobs!;
        if (jobModal.jobs!.length < searchlimit) {
          reachedTheEndofsearch = true;
        } else {
          spage++;
        }
      } else {
        reachedTheEndofsearch = true;
      }
      //   update(["find"]);
    } else {
      debugPrint("issue in jobSearch statuscode ${response.statusCode.toString()} msg ${response.body.toString()}");
    }
    isSearching = false;
    update(["find"]);
  }

  getmoreSearchedjob() async {
    isSearching = true;
    debugPrint("${ApiString.search}?page=$spage&limit=$searchlimit&location=$location&jobTittle=$jobTittle");
    http.Response response = await client.get(
      Uri.parse(
          "${ApiString.allJobs}?page=$spage&limit=$searchlimit&location=$location&workType=&jobType=&timePeriod=&payType=&pay=&availability=&dateOfPosting=&jobTittle=$jobTittle"),
      headers: {"Authorization": userModal.token ?? token, "Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      if (jobModal.jobs!.isNotEmpty) {
        searchjobs.addAll(jobModal.jobs!);
        if (jobModal.jobs!.length < searchlimit) {
          reachedTheEndofsearch = true;
        } else {
          spage++;
        }

        update(["find"]);
      } else {
        reachedTheEndofsearch = true;

        update(["find"]);
      }
    } else {
      debugPrint("issue in getmoreSearchedjob statuscode ${response.statusCode.toString()} msg ${response.body.toString()}");
    }
    isSearching = false;
  }

  saveJob(String id) async {
    await http.get(
      Uri.parse("${ApiString.save}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
  }

  getSaveJobs() async {
    http.Response response = await http.get(
      Uri.parse(ApiString.getsave),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      jobModal = JobModal.fromRawJson(response.body);
      if (jobModal.jobs!.isEmpty) {
        savedjobs = jobModal.jobs!;

        update();
      }
      // else {

      //   update();
      // }
    } else {
      return null;
    }
  }

  selecteCategories(int index) {
    selectedCategories[index] = !selectedCategories[index];
    update(["find"]);
  }
}
