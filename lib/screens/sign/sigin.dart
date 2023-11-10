import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../services/notification_service.dart';

class CandidateSigin extends StatefulWidget {
  const CandidateSigin({super.key});

  @override
  State<CandidateSigin> createState() => _CandidateSiginState();
}

class _CandidateSiginState extends State<CandidateSigin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ValueNotifier<bool> loading = ValueNotifier(false);
//  bool loading = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static SnackBar phonenotvalid = const SnackBar(
    content: Text('Please Enter correct phone no.'),
    backgroundColor: errorColor,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  static SnackBar empty = const SnackBar(
    content: Text('Please Enter the Phone no.'),
    backgroundColor: errorColor,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  static SnackBar notCorrect = const SnackBar(
    content: Text('Please Enter the right phone no.'),
    backgroundColor: errorColor,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  static Widget svg = const SvgPicture(
    AssetBytesLoader('assets/svg/welcome.svg.vec'),
    fit: BoxFit.fitWidth,
  );

  Brightness brightness = Brightness.light;
  final UserProvider userProvider = UserProvider();
  String? phoneno;
  @override
  Widget build(BuildContext context) {
    debugPrint("sign in build called");
    FlutterView flutterView = View.of(context);
    brightness = flutterView.platformDispatcher.platformBrightness;
    flutterView.platformDispatcher.onPlatformBrightnessChanged = () {
      setState(() {
        brightness = flutterView.platformDispatcher.platformBrightness;
      });
    };
    final Size size = flutterView.display.size;

    return Theme(
      data: brightness.name == "dark" ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                brightness.name != "dark"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(width: size.width * .25, height: size.width * .15, child: svg),
                      )
                    : AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return ClipPath(
                            clipper: DrawClip(_controller.value),
                            child: Container(
                              height: size.height * 0.07,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                                  Color.fromRGBO(111, 22, 190, 1),
                                  Color.fromRGBO(186, 98, 255, 1),
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 12, bottom: size.height * 0.07),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.business),
                          InkWell(child: Text("Switch to the employer")),
                        ],
                      ),
                    ),
                    const Text(
                      "  Candidate \n  Sign-in/Signup",
                      style: TextStyle(fontSize: 28.5, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "  you will log in after the verification if you are not registered.",
                        style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "                      Please Enter the Phone No.",
                        style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.normal),
                      ),
                    ),
                    InternationalPhoneNumberInput(
                      selectorConfig: const SelectorConfig(),
                      initialValue: PhoneNumber(dialCode: "+91", isoCode: "IN"),
                      onFieldSubmitted: (value) => (phoneno != null)
                          ? phoneno!.isNotEmpty
                              ? userProvider.signIn(phoneno!).then(
                                  (response) {
                                    if (response.status.isOk) {
                                      final data = response.body;
                                      debugPrint(data?.otp.toString() ?? "didnot get");

                                      NotificationService.showNotification(
                                        title: "Hiring Roof Otp",
                                        body: data?.otp.toString() ?? "bnfkjn",
                                      );
                                      // Handle the response data
                                    } else {
                                      throw Exception('Failed to load data');
                                    }
                                  },
                                )
                              : ScaffoldMessenger.of(context).showSnackBar(empty)
                          : ScaffoldMessenger.of(context).showSnackBar(notCorrect),
                      onInputChanged: (PhoneNumber value) {
                        phoneno = value.phoneNumber;
                      },
                    ),
                    InkWell(
                        onTap: () {
                          if (!loading.value) {
                            //   setState(() {
                            loading.value = false;
                            //   });
                          }

                          (phoneno != null)
                              ? phoneno!.isNotEmpty
                                  ? phoneno!.isPhoneNumber
                                      ? userProvider.signIn(phoneno!).then(
                                          (response) {
                                            if (response.status.isOk) {
                                              final data = response.body;
                                              debugPrint(data?.otp.toString() ?? "didnot get");
 
                                              NotificationService.showNotification(
                                                title: "Hiring Roof Otp",
                                                body: data?.otp.toString() ?? "bnfkjn",
                                              );
                                              // Handle the response data
                                            } else {
                                              if (loading.value) {
                                                //   setState(() {
                                                loading.value = false;
                                                //   });
                                              }
                                              throw Exception('Failed to load data');
                                            }

                                            if (loading.value) {
                                              //   setState(() {
                                              loading.value = false;
                                              //   });
                                            }
                                          },
                                        )
                                      : ScaffoldMessenger.of(context).showSnackBar(phonenotvalid)
                                  : ScaffoldMessenger.of(context).showSnackBar(empty)
                              : ScaffoldMessenger.of(context).showSnackBar(notCorrect);
                          if (loading.value) {
                            //   setState(() {
                            loading.value = false;
                            //   });
                          }
                        },
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                                transform: GradientRotation(7),
                                colors: [
                                  Color.fromRGBO(144, 2, 255, 1),
                                  Color.fromRGBO(186, 98, 255, 1),
                                ],
                                tileMode: TileMode.decal,
                                end: Alignment.bottomRight,
                                begin: Alignment.topLeft),
                          ),
                          child: ValueListenableBuilder<bool>(
                              valueListenable: loading,
                              builder: (context, val, child) {
                                return loading.value
                                    ? const CircularProgressIndicator.adaptive()
                                    : const Text(
                                        "join us",
                                        style: TextStyle(color: white),
                                      );
                              }),
                        )),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "  By continuing you agree to Hiring roof's Term & Condition and\n  confirm that you have read Hiring roof's Privacy policy.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter = size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
