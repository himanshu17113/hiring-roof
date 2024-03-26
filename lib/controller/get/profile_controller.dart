import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  @override
  void onClose() {
    disposeTextEditingController();
    super.onClose();
  }

  RxString videopath = RxString('');
  // final Verify userModal;
  //  ProfileController(this.userModal);
  static Client client = http.Client();
  Rx<XFile> profilepic = XFile("").obs;
  Rx<XFile> profilevid = XFile("").obs;
  Rx<File> resumefile = File("").obs;
  Rx<File> letter = File("").obs;
  XFile img = XFile('');
  String gender = (userModal.userData!.gender!.isNotEmpty ? userModal.userData?.gender : 'Male') ?? 'Male';
  DateTime? dob = (userModal.userData?.dob != null || userModal.userData!.dob!.isNotEmpty)
      ? DateTime.tryParse(userModal.userData!.dob!)
      : null;
  final TextEditingController name = TextEditingController(text: userModal.userData?.name ?? "");
  final TextEditingController phone = TextEditingController(
      text: userModal.userData?.phone
          //?.replaceRange(0, 3, "")
          ??
          "");
  final TextEditingController skill = TextEditingController(text: userModal.userData?.skills.toString() ?? "");
  final TextEditingController email = TextEditingController(text: userModal.userData?.email ?? "");
  final TextEditingController experience = TextEditingController(text: userModal.userData?.experience ?? "");
  final TextEditingController currentPay = TextEditingController(text: userModal.userData?.currentPay ?? "");
  final TextEditingController expectedPay = TextEditingController(text: userModal.userData?.expectationPay ?? "");
  final TextEditingController location = TextEditingController(text: userModal.userData?.location ?? "");
  final TextEditingController companyName = TextEditingController(text: userModal.userData?.companyName ?? "");
  final TextEditingController aboutCompany = TextEditingController(text: userModal.userData?.aboutCompany ?? "");
  final TextEditingController alternativePhone = TextEditingController(
      text: userModal.userData!.alternativePhone != null
          ? userModal.userData!.alternativePhone!.isEmpty
              ? ""
              : userModal.userData?.alternativePhone?.replaceRange(0, 3, "")
          : "");

  set profileVid(value) => profilevid.value = value;
  XFile get profileVid => profilevid.value;

  // final _obj = ''.obs;
  set profilePic(value) => profilepic.value = value;
  XFile get profilePic => profilepic.value;
//resume
  set resumeFile(value) => resumefile.value = value;
  File get resumeFile => resumefile.value;
//letter
  set letterFile(value) => letter.value = value;
  File get letterFile => letter.value;

  RxBool isUploading = RxBool(false);
  Future<XFile?> pickImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    // .whenComplete(() => update(["profilePic"]));
  }

  Future<XFile?> pickVideo() async {
    return await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    // .whenComplete(() => update(["profilePic"]));
  }

  disposeTextEditingController() {
    name.clear();

    phone.clear();
    skill.clear();
    email.clear();
    experience.clear();
    currentPay.clear();
    expectedPay.clear();
    location.clear();
    companyName.clear();
    aboutCompany.clear();
  }

  Future<File?> document() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
    return null;
    // .whenComplete(() => update(["profilePic"]));
  }

  Future<File?> video() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
    return null;
    // .whenComplete(() => update(["profilePic"]));
  }

  Future videopathx() async {
    final result = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (result != null) {
      videopath.value = (result.path);
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
    //  payload.addIf(dob != null, 'dob', "${dob!.hour}:${dob!.minute}");

    var request = http.MultipartRequest('PUT', Uri.parse(ApiString.updateProfile(userModal.userId!)));
    request.fields.addAll(payload);
    request.files.addIf(profilePic.path.isNotEmpty,
        await http.MultipartFile.fromPath('profileImage', profilePic.path, filename: profilePic.name));
    //   request.files.addIf(resumeFile.path.isNotEmpty,
    //   await http.MultipartFile.fromPath('resume', resumeFile.path, filename: resumeFile.path.split('/').last.split(".").first));
    // await http.MultipartFile.fromPath('videoUrl', videopath.string, filename: videopath.string.split('/').last.split(".").first);
    // if (img.path.isNotEmpty) {
    //   request.files.add(await http.MultipartFile.fromPath('companyLogo', img.path, filename: 'logo'));
    // }
  }

  Future<bool> updateProfil() async {
    isUploading.value = true;
    Map<String, String> payload = {
      "phone": "+91${phone.text}",
      "name": name.text,
      "email": email.text,
      "location": location.text,
      "currentPay": currentPay.text,
      "expectationPay": expectedPay.text,
      "skills": skill.text,
      "experience": experience.text,
      "companyName": companyName.text,
      "aboutCompany": aboutCompany.text,
      'gender': gender,
      'alternativePhone': "+91${alternativePhone.text}",
    };
    if (dob != null) {
      payload.addIf(dob != null, 'dob', "${dob!.hour}:${dob!.minute}");
    }
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
    if (letterFile.uri.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('letter', letterFile.path,
          filename: letterFile.path.split('/').last.split(".").first));
    }
    if (img.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('companyLogo', img.path, filename: 'logo'));
    }

    if (videopath.string.isNotEmpty) {
      debugPrint(videopath.value);
      request.files.add(await http.MultipartFile.fromPath(
        'videoUrl',
        videopath.value,
        filename: videopath.value.split('/').last.split(".").first,
      ));
    } else {
      debugPrint('no video');
    }
    var multipartResponse = await request.send();
    isUploading.value = false;
    var res = await http.Response.fromStream(multipartResponse);
    debugPrint(res.body);
    debugPrint(multipartResponse.statusCode.toString());
    if (multipartResponse.statusCode == 200) {
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

  Future<bool> removeProfilePic() async {
    isUploading.value = true;

    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
          ApiString.updateProfile(userModal.userId!),
        ));
    request.headers.addAll({"Authorization": userModal.token!});

    // request.files.(await http.MultipartFile.fromPath('profileImage', "", filename:  ''));

    var multipartResponse = await request.send();
    isUploading.value = false;
    var res = await http.Response.fromStream(multipartResponse);
    debugPrint(res.body);
    debugPrint(multipartResponse.statusCode.toString());
    if (multipartResponse.statusCode == 200) {
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

  Future<bool> removePic() async {
    isUploading.value = true;
    Map<String, String?> payload = {'profileImage': null};

    final response = await http.put(
        Uri.parse(
          ApiString.updateProfile(userModal.userId!),
        ),
        headers: {"Authorization": userModal.token!},
        body: json.encode(payload));

    isUploading.value = false;
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      userModal.userData = UserData.fromMap(jsonDecode((response.body))["user"]);
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
