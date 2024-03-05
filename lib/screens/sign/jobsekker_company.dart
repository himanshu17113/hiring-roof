import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/startcontroller.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/Profile/profile.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/reqprebottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';
import 'package:hiring_roof/util/widgets/bottom/userprebottom.dart';
import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/util/constant/color.dart';

class SeekerorCompany extends StatefulWidget {
  final bool isFirtTime;
  final int otp;
  final String phoneNo;
  const SeekerorCompany({super.key, required this.isFirtTime, required this.otp, required this.phoneNo});

  @override
  State<SeekerorCompany> createState() => _SeekerorCompanyState();
}

class _SeekerorCompanyState extends State<SeekerorCompany> with SingleTickerProviderStateMixin {
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

  final UserProvider userProvider = UserProvider();

  String? phoneno;
  @override
  Widget build(BuildContext context) {
    final size = query!.size;

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
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/png/img_vector_2.png",
                height: size.height * 0.3,
                fit: BoxFit.fitWidth,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return ClipPath(
                  clipper: DrawClip(_controller.value),
                  child: Container(
                    height: PlatformInfo.isAppOS() ? size.height * 0.2 : 200,
                    decoration: const BoxDecoration(gradient: linearGradient),
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Are you Job seeker \nor Company ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.5, fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      userProvider.verifey(widget.phoneNo, widget.otp, widget.isFirtTime, true).then((response) {
                        debugPrint(response.statusCode.toString());
                        if (response.statusCode == 200) {
                          userModal = response.body!;
                          Get.delete<StartxController>(tag: "start", force: true);
                          //  Get.put<JobxController>(JobxController(), tag: "job", ) ;

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => widget.isFirtTime
                                    ? const Profile(
                                        profileMobileBody: ProfileMobileBody(),
                                        profileDeskBody: ProfileDesk(),
                                      )
                                    : const UNav(),
                              ),
                              ((route) => false));
                        }
                      });
                    },
                    child: Container(
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(8),
                            gradient: linearGradient),
                        child: const Text(
                          "Job Seeker",
                          style: TextStyle(color: white),
                        ))),
                InkWell(
                  onTap: () {
                    userProvider.verifey(widget.phoneNo, widget.otp, widget.isFirtTime, false).then((response) {
                      debugPrint(response.statusCode.toString());
                      if (response.statusCode == 200) {
                        userModal = response.body!;
                        Get.delete<StartxController>(tag: "start", force: true);
                        //  Get.put<JobxController>(JobxController(), tag: "job", ) ;

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget.isFirtTime
                                  ? const Profile(
                                      profileMobileBody: ProfileMobileBody(),
                                      profileDeskBody: ProfileDesk(),
                                    )
                                  : const UNav(),
                            ),
                            ((route) => false));
                      }
                    });
                  },
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
                        " Company ",
                      )),
                ),
              ],
            ),
          ],
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
