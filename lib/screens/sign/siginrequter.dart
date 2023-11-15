import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:hiring_roof/screens/sign/sigin.dart';
import 'package:hiring_roof/screens/sign/verify.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../services/notification_service.dart';

class RecruiterSigin extends StatefulWidget {
  const RecruiterSigin({super.key});

  @override
  State<RecruiterSigin> createState() => _RecruiterSiginState();
}

class _RecruiterSiginState extends State<RecruiterSigin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ValueNotifier<bool> loading = ValueNotifier(false);
  bool isloading = false;
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
    loading.dispose();
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
                              height: PlatformInfo().isAppOS() ? size.height * 0.07 : 200,
                              decoration: const BoxDecoration(gradient: linearGradient),
                            ),
                          );
                        },
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CandidateSigin(),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 12, bottom: size.height * 0.07),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.business),
                            InkWell(child: Text("Switch to the candidate")),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      "  Recruiter \n  Sign-in/Signup",
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
                                    } else {
                                      throw Exception('Failed to load data');
                                    }
                                  },
                                )
                              : ScaffoldMessenger.of(context).showSnackBar(empty)
                          : ScaffoldMessenger.of(context).showSnackBar(notCorrect),
                      onInputChanged: (PhoneNumber value) {
                        phoneno = value.phoneNumber;
                        debugPrint(phoneno!.length.toString());
                      },
                    ),
                    InkWell(
                        onTap: () {
                          // if (!loading.value) {

                          // loading.value = true;
                          // //if (!isloading) {
                          // setState(() {
                          //   isloading = true;
                          // });
                          // }

                          //   }

                          (phoneno != null)
                              ? phoneno!.isNotEmpty
                                  ? phoneno!.length == 13
                                      ? userProvider.signIn(phoneno!).then(
                                          (response) {
                                            userProvider.phoneno = phoneno!;
                                            if (response.status.isOk) {
                                              final data = response.body;
                                              debugPrint(data?.otp.toString() ?? "didnot get");
                                              PlatformInfo().isDesktopOS()
                                                  ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                      duration: const Duration(seconds: 10),
                                                      behavior: SnackBarBehavior.floating,
                                                      action: SnackBarAction(
                                                          label: "Copy OTP",
                                                          onPressed: () => Clipboard.setData(ClipboardData(text: data?.otp?.toString() ?? ""))),
                                                      content: Text(data?.otp.toString() ?? "Did not get the Otp try again")))
                                                  : NotificationService.showNotification(
                                                      title: "Hiring Roof Otp",
                                                      body: data?.otp.toString() ?? "bnfkjn",
                                                    );
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => VerificationScreen(
                                                            isDark: brightness.name == "dark",
                                                            isFirstTime: data!.firstTime!,
                                                            otp: data.otp!,
                                                            phoneNo: phoneno!,
                                                            isJobseeker: false,
                                                          )));
                                            } else {
                                              if (loading.value) {
                                                loading.value = false;
                                              }
                                              throw Exception('Failed to load data');
                                            }

                                            if (loading.value) {
                                              loading.value = false;
                                            }
                                          },
                                        )
                                      : ScaffoldMessenger.of(context).showSnackBar(phonenotvalid)
                                  : ScaffoldMessenger.of(context).showSnackBar(empty)
                              : ScaffoldMessenger.of(context).showSnackBar(notCorrect);
                          // if (loading.value) {
                          //   loading.value = false;
                          // }
                          // if (isloading) {
                          //   setState(() {
                          //     isloading = false;
                          //   });
                          //    }
                        },
                        child: Container(
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                            decoration:
                                BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                            child: isloading
                                ? const CircularProgressIndicator.adaptive()
                                : const Text(
                                    "Join us",
                                    style: TextStyle(color: white),
                                  )
                            // ValueListenableBuilder<bool>(
                            //     valueListenable: loading,
                            //     builder: (context, val, child) {
                            //       //a          debugPrint(val.toString());
                            //       return val
                            //           ? const CircularProgressIndicator.adaptive()
                            //           : const Text(
                            //               "Join us",
                            //               style: TextStyle(color: white),
                            //             );
                            //     }),

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
