import 'package:get/get_connect/connect.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/model/login.dart';
import 'package:hiring_roof/model/verify.dart';
import 'package:hiring_roof/util/apistring.dart';

class UserProvider extends GetConnect {
  final SharedPref sharedPref = SharedPref();

  String? phoneno;
  final GetConnect connect = GetConnect(
    timeout: const Duration(seconds: 10),
  );

  Future<Response<Login>> signIn(String phoneno) => post<Login>(ApiString.signin, {"phone": phoneno}, decoder: (obj) => Login.fromMap(obj));

  Future<Response<Verify>> verifey(String phoneno, int otp, bool isFirstTime, bool isjobseeker) =>
      put<Verify>(ApiString.verify, {"phone": phoneno, "otp": otp, "userType": isjobseeker ? "jobSeeker" : "company", "firstTime": isFirstTime}, decoder: (obj) {
        final verify = Verify.fromMap(obj);
      //  print(verify.userType.toString());
        sharedPref.saveModel(verify);
        return verify;
      });
}
