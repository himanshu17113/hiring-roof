import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/screens/intro/intero_screen.dart';
import 'package:hiring_roof/screens/sign/signin.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';

import 'services/notification_service.dart';
import 'util/constant/const.dart';
import 'util/theme.dart';

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
  //sharedPref.removeUser();
  await NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    screenSize = query!.size;
    // isjobSeeker = userModal.userType == "jobSeeker";
    tablet = screenSize.width < 1200 ? true : false;
    debugPrint(userModal.userId);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: MaterialTheme.dark(),
      theme: MaterialTheme.dark(),
      home: userModal.userId == null
          ? const Sigin()
          : userModal.userType == "jobSeeker"
              ? const UNav()
              : const ReqNav(),
    );
  }
}
