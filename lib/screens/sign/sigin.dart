import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:hiring_roof/controller/connect/authconnect.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CandidateSigin extends StatelessWidget {
  CandidateSigin({super.key});

  // GetView<Authantication>
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> showNotification(int otp) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '123', // Change this to a unique ID
      'Local Notifications',
      //  'Show local notifications',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Hello, Flutter!',
      otp.toString(),
      platformChannelSpecifics,
    );
  }

  final UserProvider userProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Brightness.light;
    brightness = View.of(context).platformDispatcher.platformBrightness;
    debugPrint(brightness.name);
    return Theme(
      //  data: ThemeData.localize(baseTheme, localTextGeometry) ,
      data: brightness.name == "dark" ? ThemeData.dark() : ThemeData.light(),
      child: Material(
        child: SafeArea(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/png/botomElipse.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, right: 12, bottom: 40),
                  child: Row(
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
                    "      Please Enter the Phone No.",
                    style: TextStyle(
                        fontSize: 16.5, fontWeight: FontWeight.normal),
                  ),
                ),
                InternationalPhoneNumberInput(
                  selectorConfig: const SelectorConfig(),
                  initialValue: PhoneNumber(
                      dialCode: "+91",
                      //  phoneNumber: "+91 703 754 3555",
                      isoCode: "IN"),
                  onFieldSubmitted: (value) => userProvider.signIn(value).then(
                    (response) {
                      if (response.status.isOk) {
                        final data = response.body;
                        debugPrint(data?.otp.toString() ?? "didnot get");
                        print(response.body.toString());
                        showNotification(data!.otp!);
                        // Handle the response data
                      } else {
                        throw Exception('Failed to load data');
                      }
                    },
                  ),
                  onInputChanged: (PhoneNumber value) {},
                ),
                Container(
                  width: double.maxFinite,
                  //   height: 0,
                  // width: 70,

                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
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
                        begin: Alignment.topLeft),
                  ),
                  child: const Text(
                    "join us",
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
