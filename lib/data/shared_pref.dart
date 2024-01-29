import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:hiring_roof/util/apistring.dart';
import 'package:http/http.dart' as http;
import 'package:hiring_roof/model/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constant/const.dart';

late SharedPreferences prefs;

class SharedPref {
  // Verify verify = Verify();
  init() async {
    prefs = await SharedPreferences.getInstance();
    await getUser();
    getuseronline();
  }

  // Verify?
  getUser() {
    String? jsonString = prefs.getString('userRecord');
    //print(jsonString);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      //   return
      userModal = Verify.fromJson(jsonMap);
    }

//return null;
  }

  saveModel(Verify model) {
    String jsonString = jsonEncode(model.toJson());
    prefs.setString('userRecord', jsonString);
  }

  saveModelString(String model) async {
    prefs.setString('userRecord', model);
  }

  removeUser() async {
    prefs.remove('userRecord');
    userModal = Verify();
  }

  getuseronline() async {
    http.Response response = await http.get(Uri.parse(ApiString.getProfile(userModal.userId!)));
    if (response.statusCode == 200) {
      userModal.userData = UserData.fromJson(jsonDecode(response.body)["userRecord"]);
      saveModel(userModal);
      return userModal;
    } else {
      return null;
    }
  }
}
