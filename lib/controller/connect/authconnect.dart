import 'package:get/get_connect/connect.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/model/login.dart';
import 'package:hiring_roof/model/verify.dart';
import 'package:hiring_roof/util/constant/text.dart';
 
class UserProvider extends GetConnect {
  // Login login = Login();
  // Verify verify = Verify();
  final SharedPref sharedPref = SharedPref();

  String? phoneno;
  final GetConnect connect = GetConnect(
    timeout: const Duration(seconds: 10),
  );

//   Future<Response<Login>> signIn(String phoneno) async {
//     Map<String, String> body = {"phone": phoneno};

//     final Response<Login> response = await connect.post<Login>(
//         signin, body,
//         decoder: (obj) => Login.fromJson(obj));

// //    final Response response = await get('http://youapi/users/$id');
//    // Login.fromJson(response.body);
//     return response;
//   }
  // Future<Response<Login>> signIn(String phoneno) =>
  //     post<Login>(signin, {"phone": phoneno},
  //         decoder: (obj) => Login.fromMap(obj));
  Future<Response<Login>> signIn(String phoneno) => post<Login>(signin, {"phone": phoneno}, decoder: (obj) =>  Login.fromMap(obj));

  Future<Response<Verify>> verifey(String phoneno, int otp, bool isFirstTime, bool isjobseeker) =>
      put<Verify>(verifyApi, {"phone": phoneno, "otp": otp, "userType": isjobseeker ? "jobSeeker" : "company", "firstTime": isFirstTime}, decoder: (obj) {
      final  verify = Verify.fromMap(obj);
        sharedPref.saveModel(verify);
        return verify;
      });
}
