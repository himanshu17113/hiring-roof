import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hiring_roof/screens/sign/sigin.dart';
 
import 'services/notification_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
 
  WidgetsFlutterBinding.ensureInitialized();

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
        home: const CandidateSigin()
        // const Nav(),
        );
  }
}
