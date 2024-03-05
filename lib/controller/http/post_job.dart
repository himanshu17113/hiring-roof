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
    final String experience,
    final String service,
    final String stream,
    final String vacancy,
    //final File? file
  ) async {
    //debugPrint(statement);(title.toString());
    // final Map<String, String> header = {"Authorization": userModal.token!};

    Map<String, String> payload = {
      "jobTittle": title,
      "skills": '["$knowledge"]',
      "jobType": workingPlace,
      "workType": jobType,
      "availability": availability,
      "timePeriod": timePeriod,
      "note": jobSummary,
      "pay": pay,
      "payType": payType,
      "location": location,
      "companyName": 'companyName',
      'stream': '["$stream"]',
      //    'serviceType': service,
      'experience': experience,
      'vacancies': vacancy
    };
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
          ApiString.putJob,
        ));

    request.fields.addAll(payload);
    request.headers.addAll({"Authorization": userModal.token!, 'Content-Type': 'multipart/form-data'});

    if (path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('companyLogo', path, filename: 'logo'));
    }
    print(request.fields.toString());

    final multipartResponse = await request.send();
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

    // var response = await put(ApiString.putJob, formData, headers: header, contentType: "multipart/form-data");
    // print(response.body);
    //  var request = client.put('PUT', Uri.parse(ApiString.putJob));
    // request.headers.addAll(header);
    // request.fields.addAll(body);
    // http.Response response = await client.put(Uri.parse(ApiString.putJob), headers: , body: jsonEncode(body));
    var response = await http.Response.fromStream(multipartResponse);
    print(response.body);
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
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
