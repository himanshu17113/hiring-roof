import 'package:hiring_roof/util/apistring.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:http/http.dart' as http;

class Cardconnect {
  Future<bool> saveJob(String id) async {
    print("${ApiString.save}$id");
    http.Response response = await http.put(
      Uri.parse("${ApiString.save}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> applyJob(String id) async {
    print("${ApiString.apply}$id");
    http.Response response = await http.post(
      Uri.parse("${ApiString.apply}$id"),
      headers: {"Authorization": userModal.token!, "Content-Type": "application/json"},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
