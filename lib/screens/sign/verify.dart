import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/util/widgets/bottom.dart';

import '../../util/constant/color.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);

class VerificationScreen extends StatefulWidget {
  final bool isDark;
  final bool isJobseeker;
  final bool isFirstTime;
  final int otp;
  final String phoneNo;
  const VerificationScreen({super.key, required this.otp, required this.isDark, required this.phoneNo, required this.isJobseeker, required this.isFirstTime});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  int numberOfFields = 5;
  String? verification;
  bool clearText = false;
  final UserProvider userProvider = UserProvider();
  @override
  void initState() {
    numberOfFields = widget.otp.toString().length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = widget.isDark ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: widget.isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //    backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification Code",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                "We texted you a code",
                style: theme.textTheme.titleLarge,
              ),
              Text("Please enter it below", style: theme.textTheme.titleLarge),
              const Spacer(flex: 2),
              OtpTextField(
                numberOfFields: numberOfFields,
                borderColor: const Color(0xFF512DA8),
                focusedBorderColor: primaryColor,
                clearText: clearText,
                showFieldAsBox: true,
                textStyle: theme.textTheme.titleMedium,
                onCodeChanged: (String value) {},
                handleControllers: (controllers) {
                  controls = controllers;
                },
                onSubmit: (String verificationCode) {
                  verification = verificationCode;
                  if (widget.otp.toString() == verificationCode) {
                    userProvider.verifey(widget.phoneNo, widget.otp, widget.isFirstTime, widget.isJobseeker).then((response) {
                      debugPrint(response.statusCode.toString());
                      if (response.statusCode == 200) {
                        while (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.pop(context);
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Nav(),
                            ));
                      }
                    });
                  }
                },
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "This helps us verify every user in our market place",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => userProvider.verifey(widget.phoneNo, widget.otp, true, widget.isJobseeker).then((response) {}),
                  child: Text(
                    "Didn't get code?",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              const Spacer(flex: 3),
              CustomButton(
                onPressed: () {
                        if (widget.otp.toString() == verification) {
                    userProvider.verifey(widget.phoneNo, widget.otp, widget.isFirstTime, widget.isJobseeker).then((response) {
                      debugPrint(response.statusCode.toString());
                      if (response.statusCode == 200) {
                        while (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.pop(context);
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Nav(),
                            ));
                      }
                    });
                  }
                },
                title: "Confirm",
                color: primaryColor,
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
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
