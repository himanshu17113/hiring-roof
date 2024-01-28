import 'dart:convert';

import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class DoUpdate {
  static Future<bool> doShortlist(
    final String id,
    final bool job,
    final bool shortlist,
    final bool interveiw,
    final bool interveiw2,
  ) async {
    String base = "";
     if (job) {
       base = ApiString.doShortlist;
     } else if(shortlist) {
        base = ApiString.interviewselect;
     }else if(interveiw) {
               base = ApiString.interview2select;

     }else if(interveiw2) {
                      base = ApiString.selected;

     } 
    http.Response response = await http.put(
      Uri.parse("$base$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> doNotShortlist(String id) async {
    http.Response response = await http.put(
      Uri.parse("${ApiString.doNotSelect}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    //  print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      //  print(response.body.toString());
      return false;
    }
  }

  static Future<bool> interveiwSelect(String id, String date, String time) async {
    Map<String, String> body = {"interviewsDate": date, "interviewsTime": time};
    http.Response response = await http.put(
      Uri.parse("${ApiString.interviewselect}$id"),
      body: json.encode(body),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    // print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
