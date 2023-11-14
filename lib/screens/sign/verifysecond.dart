import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hiring_roof/screens/sign/verify.dart';
import '../../util/constant/color.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late List<TextStyle?> otpTextStyles;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    otpTextStyles = [
      createStyle(accentPurpleColor),
      createStyle(accentYellowColor),
      createStyle(accentDarkGreenColor),
      createStyle(accentOrangeColor),
      createStyle(accentPinkColor),
      createStyle(accentPurpleColor),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
              numberOfFields: 6,
              borderColor: accentPurpleColor,
              focusedBorderColor: accentPurpleColor,
              styles: otpTextStyles,
              showFieldAsBox: false,
              borderWidth: 4.0,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {},
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
              child: Text(
                "Didn't get code?",
                style: theme.textTheme.titleMedium,
              ),
            ),
            const Spacer(flex: 3),
            CustomButton(
              onPressed: () {},
              title: "Confirm",
              color: mediumPurpel,
              textStyle: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.displaySmall?.copyWith(color: color);
  }
}
