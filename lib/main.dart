import 'package:flutter/material.dart';
import 'package:hiring_roof/screens/sign/sigin.dart';

import 'screens/sign/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Brightness.light;
    brightness = View.of(context).platformDispatcher.platformBrightness;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
     //    brightness: brightness,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:   CandidateSigin()
        // const Nav(),
        );
  }
}
