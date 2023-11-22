import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';

import '../../model/job.dart';
import '../../util/constant/text.dart';

class JobProvider extends GetConnect {
  
 


  Future<Response<JobModal>> getMyJobs() {
    debugPrint("api hit");
    return get<JobModal>(ApiString.myJobs, headers: {"Authorization": userModal.token!, "Content-Type": "application/json"}, decoder: (obj) => JobModal.fromJson(obj));
  }
}
