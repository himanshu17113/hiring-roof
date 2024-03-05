import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/jobseeker_application_controller.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Cardconnect {
  static MyJobsxController jobsxController = Get.put(MyJobsxController());
  static Future<bool> saveJob(String id) async {
    http.Response response = await http.put(
      Uri.parse("${ApiString.save}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      jobsxController.getSaved(clear: true);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> applyJob(String id) async {
    int apic = 2;
    debugPrint("${ApiString.apply}$id");
    http.Response response = await http.post(
      Uri.parse("${ApiString.apply}$id"),
      body: [],
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    debugPrint(response.body.toString());

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      http.Response response = await http.post(
        Uri.parse("${ApiString.apply}$id"),
        body: [{}],
        headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
      );
      debugPrint(response.body.toString());

      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
      //  return false;
    }
  }
}
