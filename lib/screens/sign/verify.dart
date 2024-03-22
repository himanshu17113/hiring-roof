import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/controller/get/jobcontroller.dart';
import 'package:hiring_roof/controller/get/startcontroller.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/Profile/profile.dart';
import 'package:hiring_roof/screens/sign/jobsekker_company.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';

import '../../util/constant/color.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);

class VerificationScreen extends StatefulWidget {
  final bool isFirstTime;
  final int otp;
  final String phoneNo;
  const VerificationScreen({super.key, required this.otp, required this.phoneNo, required this.isFirstTime});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with SingleTickerProviderStateMixin {
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  int numberOfFields = 5;
  String? verification;
  bool clearText = false;
  final UserProvider userProvider = UserProvider();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    numberOfFields = widget.otp.toString().length;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      screenSize = query!.size;

    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/png/img_vector_2.png",
              height: screenSize.height * 0.3,
              fit: BoxFit.fitWidth,
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ClipPath(
                clipper: DrawClip(_controller.value),
                child: Container(
                  height: PlatformInfo.isAppOS() ? screenSize.height * 0.2 : 200,
                  decoration: const BoxDecoration(gradient: linearGradient),
                ),
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter OTP",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                "Please Enter 6 digit OTP For \nVerification",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: white90),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: OtpTextField(
                      fieldWidth: 45,
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.05),
                      filled: true,
                      numberOfFields: numberOfFields,
                      borderWidth: 0,
                      focusedBorderColor: Colors.transparent,
                      enabledBorderColor: Colors.transparent,
                      clearText: clearText,
                      showFieldAsBox: true,
                      textStyle: textTheme.titleMedium,
                      onCodeChanged: (String value) {},
                      handleControllers: (controllers) {
                        controls = controllers;
                      },
                      onSubmit: (String verificationCode) {
                        verification = verificationCode;
                        if (widget.otp.toString() == verificationCode) {
                          if (!widget.isFirstTime) {
                            userProvider.verifey(widget.phoneNo, widget.otp, widget.isFirstTime, null).then((response) {
                              debugPrint(response.statusCode.toString());
                              if (response.statusCode == 200) {
                                userModal = response.body!;
                                Get.delete<StartxController>(tag: "start", force: true);
                                Get.put<JobxController>(JobxController(), tag: "job", permanent: true);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => widget.isFirstTime
                                          ? const Profile(
                                              profileMobileBody: ProfileMobileBody(),
                                              profileDeskBody: ProfileDesk(),
                                            )
                                          : userModal.userType == "jobSeeker"
                                              ? const UNav()
                                              : const ReqNav(),
                                    ),
                                    ((route) => false));
                              }
                            });
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeekerorCompany(
                                          isFirtTime: widget.isFirstTime,
                                          otp: int.parse(verificationCode),
                                          phoneNo: widget.phoneNo,
                                        )),
                                ((route) => false));
                          }
                        }
                      })),
              InkWell(
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
                        "Continue",
                        style: TextStyle(color: white),
                      )),
                  onTap: () {
                    if (widget.otp.toString() == verification) {
                      if (!widget.isFirstTime) {
                        userProvider.verifey(widget.phoneNo, widget.otp, widget.isFirstTime, null).then((response) {
                          debugPrint(response.statusCode.toString());
                          if (response.statusCode == 200) {
                            userModal = response.body!;
                            Get.delete<StartxController>(tag: "start", force: true);
                            Get.put<JobxController>(JobxController(), tag: "job", permanent: true);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => widget.isFirstTime
                                      ? const Profile(
                                          profileMobileBody: ProfileMobileBody(),
                                          profileDeskBody: ProfileDesk(),
                                        )
                                      : userModal.userType == "jobSeeker"
                                          ? const UNav()
                                          : const ReqNav(),
                                ),
                                ((route) => false));
                          }
                        });
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeekerorCompany(
                                      isFirtTime: widget.isFirstTime,
                                      otp: int.parse(verification ?? ""),
                                      phoneNo: widget.phoneNo,
                                    )),
                            ((route) => false));
                      }
                    }
                  }),
              const SizedBox(height: 50)
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.height = 60,
    this.elevation = 1,
    this.color = primaryColor,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final double height;
  final double elevation;
  final String title;
  final Color color;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: orchidColor,
      onPressed: onPressed,
      elevation: elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
      ),
      height: height,
      color: color,
      highlightColor: purple,
      child: Center(
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
