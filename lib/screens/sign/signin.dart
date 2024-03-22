import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/startcontroller.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/screens/sign/verify.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:hiring_roof/util/widgets/bottom/reqprebottom.dart';
import 'package:hiring_roof/util/widgets/bottom/userprebottom.dart';
import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../services/notification_service.dart';

class Sigin extends StatefulWidget {
  const Sigin({super.key});

  @override
  State<Sigin> createState() => _SiginState();
}

class _SiginState extends State<Sigin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ValueNotifier<bool> loading = ValueNotifier(false);
  bool isloading = false;
  bool isCandidate = false;
  @override
  void initState() {
    super.initState();
    Get.put<StartxController>(StartxController(), tag: "start", permanent: true);
    _controller = AnimationController(
        value: 0.0,
        duration: const Duration(seconds: 23),
        upperBound: 3,
        lowerBound: -3,
        vsync: this,
        animationBehavior: AnimationBehavior.preserve)
      ..repeat();
    // controller = AnimationController(
    //     value: 0,
    //     duration: const Duration(seconds: 2),
    //     upperBound: 10,
    //     lowerBound: -10,
    //     vsync: this,
    //     animationBehavior: AnimationBehavior.preserve)
    //   ..repeat();
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

  final UserProvider userProvider = UserProvider();

  String? phoneno;
  @override
  Widget build(BuildContext context) {
      screenSize = query!.size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: -180,
              right: -180,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: DrawClip(_controller.value * 1.2),
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: const BoxDecoration(gradient: linearGradient),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: -160,
              left: -160,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(225 / 360),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: DrawClip(_controller.value),
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: const BoxDecoration(gradient: linearGradient),
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "  Recruiter Sign-in\n / Signup",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.5, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Please fill the Phone Number",
                    style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: TextField(
                    onChanged: (value) => phoneno = value,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                InkWell(
                  onTap: () => signin(),
                  child: CallbackShortcuts(
                    bindings: <ShortcutActivator, VoidCallback>{
                      const SingleActivator(LogicalKeyboardKey.arrowUp): () => signin(),
                    },
                    child: Focus(
                      autofocus: true,
                      child: ValueListenableBuilder(
                          valueListenable: loading,
                          builder: (BuildContext context, bool value, Widget? child) => Container(
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: linearGradient),
                              child: value
                                  ? const CircularProgressIndicator.adaptive()
                                  : const Text(
                                      "Continue",
                                      style: TextStyle(color: white),
                                    ))),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => isCandidate
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PreuserNav(),
                          ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PreReqNav(),
                          )),
                  child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      decoration: BoxDecoration(
                        border: Border.all(color: purple),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        " Skip ",
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signin() {
    if (phoneno!.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(phonenotvalid);
    }
    loading.value = true;
    (phoneno != null)
        ? phoneno!.isNotEmpty
            ? phoneno!.length == 10
                ? userProvider.signIn(phoneno!).then(
                    (response) {
                      userProvider.phoneno = phoneno!;
                      if (response.status.isOk) {
                        final data = response.body;

                        debugPrint(data?.otp.toString() ?? "didnot get");
                        PlatformInfo.isDesktopOS()
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
                                payload: data?.otp.toString(),
                                body: data?.otp.toString() ?? "",
                              );
                        isloading = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationScreen(
                                      isFirstTime: data!.firstTime!,
                                      otp: data.otp!,
                                      phoneNo: phoneno!,
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
    loading.value = false;
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
