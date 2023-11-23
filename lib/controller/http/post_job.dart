 import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class JobPost extends GetConnect {
  var client = http.Client();
  final GetConnect connect = GetConnect(
    timeout: const Duration(seconds: 10),
  );

  postJob(
    final String title,
    final String location,
    final String companyName,
    final String pay,
    final String jobSummary,
    final String knowledge,
    final String timePeriod,
    final String job,
    final String workingPlace,
    final String jobType,
    final String companyLogo,
    final String availability,
    final String payType,
    final String path,
     final String fileName,
    //final File? file
  ) async {
    print(title.toString());
    Map<String, String> header = {"Authorization": userModal.token!};

    final FormData formData = FormData({
      'companyLogo': MultipartFile(File(path), filename: fileName),
      'jobTittle': title,
      "skills": knowledge,
      "jobType": workingPlace,
      "workType": jobType,
      "availability": availability,
      "timePeriod": timePeriod,
      "note": jobSummary,
      "pay": double.tryParse(pay),
      "payType": payType,
      "location": location,
      "companyName": companyName
    });
    // Map<String, dynamic> body = {
    //   'jobTittle': title,
    //   "skills": knowledge,
    //   "jobType": workingPlace,
    //   "workType": jobType,
    //   "availability": availability,
    //   "timePeriod": timePeriod,
    //   "note": jobSummary,
    //   "pay": double.tryParse(pay),
    //   "payType": payType,
    //   "location": location,
    //   "companyName": companyName
    // };

    var response = await put(ApiString.putJob, formData, headers: header, contentType: "multipart/form-data"); 
    //  var request = client.put('PUT', Uri.parse(ApiString.putJob));
    // request.headers.addAll(header);
    // request.fields.addAll(body);
    // http.Response response = await client.put(Uri.parse(ApiString.putJob), headers: , body: jsonEncode(body));
    if (response.statusCode == 200) {
      print(response.body.toString());
      return true;
    } else {
      return false;
    }
  }
  // Future<void> sign(String x) async {
  //   Map<String, String> body = {"phone": x.replaceAll("+91", "")};

  // //  Login login = Login.fromJson(response.body);
  // //  return login;
  // }
}
