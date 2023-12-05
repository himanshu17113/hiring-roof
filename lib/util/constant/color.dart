import 'package:flutter/material.dart';

const Color white = Color(0xFFFFFFFF);
const Color white30 = Color.fromRGBO(255, 255, 255, 0.3);
const Color white40 = Color.fromRGBO(255, 255, 255, 0.4);
const Color white50 = Color.fromRGBO(255, 255, 255, 0.5);
const Color white60 = Color.fromRGBO(255, 255, 255, 0.6);
const Color white70 = Color.fromRGBO(255, 255, 255, 0.702);
const Color white80 = Color.fromRGBO(255, 255, 255, 0.8);
const Color white90 = Color.fromRGBO(255, 255, 255, 0.9);
const Color black = Color(0xFF000000);
const Color black12 = Color(0x30000000);
Color vsdark = const Color.fromRGBO(35, 39, 46, 1);

Color vsheaderdark = const Color.fromARGB(255, 30, 34, 39);
const Color errorColor = Color.fromRGBO(207, 102, 121, 1);

Color purple = const Color.fromRGBO(199, 156, 252, 1);

Color lightDark = const Color.fromRGBO(39, 39, 39, 1);

Color baseDarkBG = const Color.fromRGBO(41, 41, 41, 1);

Color headerDarkBG = const Color.fromRGBO(45, 45, 45, 1);

Color lightPurple = const Color.fromRGBO(234, 128, 252, 1);

Color darkPurple = const Color.fromRGBO(187, 134, 252, 1);

Color darkGrey = const Color.fromRGBO(18, 18, 18, 1);

Color softdarkGrey = const Color.fromRGBO(60, 64, 66, 1);

Color bluedarkGrey = const Color.fromRGBO(67, 71, 84, 1);

Color scaffoldBackgroundColor = const Color(0xFF343541);

Color cardColor = const Color(0xFF444654);
Color orchidColor = const Color(0xFFDA70D6);
Color mediumPurpel = const Color(0xFF9370DB);
const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(111, 22, 190, 1),
      Color.fromRGBO(186, 98, 255, 1),
    ]);
const LinearGradient linearGradienst = LinearGradient(
    transform: GradientRotation(7),
    colors: [
      Color.fromRGBO(144, 2, 255, 1),
      Color.fromRGBO(186, 98, 255, 1),

      // Color.fromRGBO(143, 0, 255, .6),
      // Color.fromRGBO(143, 0, 255, .4),
      // Color.fromRGBO(143, 0, 255, .2),
    ],
    tileMode: TileMode.decal,
    end: Alignment.bottomRight,
    begin: Alignment.topLeft);
const LinearGradient greenGradient = LinearGradient(
  // begin: Alignment.bottomLeft,
  // end: Alignment.topRight,
  colors: [Color.fromRGBO(94, 215, 0, .2), Color.fromRGBO(94, 215, 0, .15)],
);

const LinearGradient redGradient = LinearGradient(
  // begin: Alignment.bottomLeft,
  // end: Alignment.topRight,
  colors: [Color.fromRGBO(226, 53, 53, 0.2), Color.fromRGBO(226, 53, 53, 0.15)],
);
