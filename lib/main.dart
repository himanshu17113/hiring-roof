import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hiring_roof/data/shared_pref.dart';
 import 'package:hiring_roof/screens/sign/signin.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';
 import 'services/notification_service.dart';
import 'util/constant/const.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPref sharedPref = SharedPref();
  await sharedPref.init();
  sharedPref.getUser();
  NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Brightness brightness = Brightness.light;
    // brightness = View.of(context).platformDispatcher.platformBrightness;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //    brightness: brightness,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // const Aboutus()
          userModal.userId == null
              ? const Sigin()
              : userModal.userType == "jobSeeker"
                  ? const UNav()
                  : const ReqNav(),
    );
  }
}
