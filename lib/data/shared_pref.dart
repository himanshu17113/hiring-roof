import 'dart:convert';

import 'package:hiring_roof/model/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constant/const.dart';

class SharedPref {
  late final SharedPreferences prefs;
  // Verify verify = Verify();
  init() async {
    prefs = await SharedPreferences.getInstance();
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

  saveModel(Verify model) async {
    prefs = await SharedPreferences.getInstance();
     String jsonString = jsonEncode(model.toJson());
     prefs.setString('userRecord', jsonString);
  }
    removeUser()  async {
    prefs = await SharedPreferences.getInstance();
   
    prefs.remove('userRecord' );
  }
}
