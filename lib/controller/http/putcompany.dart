import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class DoUpdate {
  static Future<bool> doShortlist(String id) async {
    http.Response response = await http.put(
      Uri.parse("${ApiString.doShortlist}$id"),
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
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(response.body.toString());
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
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
