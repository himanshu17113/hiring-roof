import 'dart:convert';
import 'package:hiring_roof/util/apistring.dart';
import '../../model/login.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Aurthentication {
  var client = http.Client();

  Future<Login> sign(String x) async {
    Map<String, String> body = {"phone": x.replaceAll("+91", "")};
    http.Response response = await client.post(Uri.parse(ApiString.signin), headers: {"Content-Type": "application/json"}, body: json.encode(body));

    Login login = Login.fromJson(response.body);
    return login;
  }
}
