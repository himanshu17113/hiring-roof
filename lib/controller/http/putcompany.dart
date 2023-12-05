import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class DoUpdate {
 static Future<bool> doShortlist(String id) async {
    http.Response response = await http.put(
      Uri.parse("${ApiString.doShortlist}$id"),
      headers: {
        "Authorization": userModal.token!,
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> applyJob(String id) async {
    http.Response response = await http.post(
      Uri.parse("${ApiString.apply}$id"),
      headers: {
        "Authorization": userModal.token!,
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
