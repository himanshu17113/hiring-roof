import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Cardconnect {
  
  static Future<bool> saveJob(String id) async {
    http.Response response = await http.put(
      Uri.parse("${ApiString.save}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> applyJob(String id) async {
    http.Response response = await http.post(
      Uri.parse("${ApiString.apply}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
