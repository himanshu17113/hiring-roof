// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';

class Profile extends StatelessWidget {
  final Widget profileMobileBody;
  final Widget profileDeskBody;
  const Profile({
    Key? key,
    required this.profileMobileBody,
    required this.profileDeskBody,
  }) : super(key: key);

  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: Colors.white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080808),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFF000000),
        shadowColor: const Color(0xFF000000),
        elevation: 20,
        backgroundColor: const Color(0xFF000000),
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'My',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(157, 33, 255, 1)),
              ),
              TextSpan(
                text: ' Profile ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 1000) {
          return profileMobileBody;
        } else {
          return profileDeskBody;
        }
      }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Container(
      //     height: 45,
      //     alignment: Alignment.center,
      //     width: double.maxFinite,
      //     padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
      //     margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
      //     decoration: BoxDecoration(
      //       color: const Color.fromRGBO(255, 255, 255, 1),
      //       borderRadius: BorderRadius.circular(8),
      //       gradient: const LinearGradient(
      //           transform: GradientRotation(7),
      //           colors: [
      //             Color.fromRGBO(144, 2, 255, 1),
      //             Color.fromRGBO(186, 98, 255, 1),

      //             // Color.fromRGBO(143, 0, 255, .6),
      //             // Color.fromRGBO(143, 0, 255, .4),
      //             // Color.fromRGBO(143, 0, 255, .2),
      //           ],
      //           tileMode: TileMode.decal,
      //           end: Alignment.bottomRight,
      //           begin: Alignment.topLeft),
      //     ),
      //     child: const Text(
      //       "Upload",
      //       style: TextStyle(color: Colors.white70),
      //     ),
      //   ),
      // ),
    );
  }
}
