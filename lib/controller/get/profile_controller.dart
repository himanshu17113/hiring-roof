import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/model/verify.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
 
import 'package:http/http.dart';

import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  // final Verify userModal;
  //  ProfileController(this.userModal);
  static Client client = http.Client();
  Rx<XFile> profilepic = XFile("").obs;
  Rx<File> resumefile = File("").obs;

  final TextEditingController name = TextEditingController(text: userModal.userData?.name ?? "");
  final TextEditingController phone = TextEditingController(text: userModal.userData?.phone ?? "");
  final TextEditingController skill = TextEditingController(text: userModal.userData?.skills ?? "");
  final TextEditingController email = TextEditingController(text: userModal.userData?.email ?? "");
  final TextEditingController experience = TextEditingController(text: userModal.userData?.experience ?? "");
  final TextEditingController currentPay = TextEditingController(text: userModal.userData?.currentPay ?? "");
  final TextEditingController expectedPay = TextEditingController(text: userModal.userData?.expectationPay ?? "");
  final TextEditingController location = TextEditingController(text: userModal.userData?.location ?? "");
  final TextEditingController companyName = TextEditingController(text: userModal.userData?.location ?? "");
  final TextEditingController aboutCompany = TextEditingController(text: userModal.userData?.location ?? "");

  // final _obj = ''.obs;
  set profilePic(value) => profilepic.value = value;
  XFile get profilePic => profilepic.value;

  set resumeFile(value) => resumefile.value = value;
  File get resumeFile => resumefile.value;
  RxBool isUploading = RxBool(false);
  Future<XFile?> pickImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    // .whenComplete(() => update(["profilePic"]));
  }

  Future<File?> document() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
    return null;
    // .whenComplete(() => update(["profilePic"]));
  }

  updateProfile(String name, String email, String phone, String address, String currentPay, String expectationPay,
      String aboutCompany, String companyName, String experience, String skills) async {
    Map<String, String> payload = {
      "phone": phone,
      "name": name,
      "email": email,
      // "profileImage": profileImage,
      "location": address,
      "currentPay": currentPay,
      "expectationPay": expectationPay,
      "skills": skills,
      "experience": experience,
      //  "resume": resume,
      "companyName": companyName,
      "aboutCompany": aboutCompany,
    };
    var request = http.MultipartRequest('PUT', Uri.parse(ApiString.updateProfile(userModal.userId!)));
    request.fields.addAll(payload);
    request.files.addIf(profilePic.path.isNotEmpty,
        await http.MultipartFile.fromPath('profileImage', profilePic.path, filename: profilePic.name));
    request.files.addIf(resumeFile.path.isNotEmpty,
        await http.MultipartFile.fromPath('resume', resumeFile.path, filename: resumeFile.path.split('/').last.split(".").first));
  }

  Future<bool> updateProfil() async {
    isUploading.value = true;
    Map<String, String> payload = {
      "phone": phone.text,
      "name": name.text,
      "email": email.text,
      "location": location.text,
      "currentPay": currentPay.text,
      "expectationPay": expectedPay.text,
      "skills": skill.text,
      "experience": experience.text,
      "companyName": companyName.text,
      "aboutCompany": aboutCompany.text,
    };
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
          ApiString.updateProfile(userModal.userId!),
        ));
    request.fields.addAll(payload);
    request.headers.addAll({"Authorization": userModal.token!});
    if (profilePic.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('profileImage', profilePic.path, filename: profilePic.name));
    }
    if (resumeFile.uri.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('resume', resumeFile.path,
          filename: resumeFile.path.split('/').last.split(".").first));
    }
    var multipartResponse = await request.send();
    isUploading.value = false;
    debugPrint(multipartResponse.statusCode.toString());
    if (multipartResponse.statusCode == 200) {
      var res = await http.Response.fromStream(multipartResponse);
      debugPrint(res.body);
      userModal.userData = UserData.fromMap(jsonDecode((res.body))["user"]);
      SharedPref().saveModel(userModal);

      return true;
    } else {
      return false;
    }

    // Get.offAll(
    //   () => userModal.userType == "jobSeeker" ? const UNav() : const ReqNav(),
    // );
  }
}
