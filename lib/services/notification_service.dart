/// Importing this for showing log
library;
import 'dart:developer';

import 'package:flutter/services.dart';

/// Dependency import for local notifications
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Remember the global varibales I have created in main.dart
/// this import allows us to use that varibale

/// Notificaition Service class handles everything regarding notifications
class NotificationService {
  /// the method is static, for making it easier to use. You can follow the object
  /// instance method as well
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    /// This is where start the initialization

// ****** Andriod Initialization ******

    /// @mipmap/ic_launcher' is the icon for the notification, which is deafult in flutter
    /// if you want to use your custom icon make sure to provide the path to that icon.

    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

// ****** IOS Initialization ******

    DarwinInitializationSettings darwinInitializationSettings = const DarwinInitializationSettings(

// this will ask permissions to display alert and others are clean with the name
        requestAlertPermission: true,
        requestBadgePermission: true,
        defaultPresentSound: true);

// ****** Combining  Initializations ******

    InitializationSettings initializationSettings =
        InitializationSettings(iOS: darwinInitializationSettings, android: androidInitializationSettings);

    /// now using the global instance of FlutterLocalNotificationsPlugin()
    /// Let's Initialize the  notification
    bool? init = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            //  selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == 'ActionId') {
              Clipboard.setData(ClipboardData(text: notificationResponse.payload ?? ""));
            }
            break;
        }
      },
    );
    log('Noti $init');
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

/* 

Notifications have few things : id, title, body and payload, 
in this method the id is optional, however you're recommended to
provide id  for different notifications. 
 
*/
  static showNotification({
    int? id = 0,
    required String title,
      String? body,
    var payload,
  }) async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
/* 

In notifications, there are few things that we keep in mind.The sound, 
how important the notification is and what is the priority of the notification, 
playload ( this basically means what data does your notifications hold ) of the notification. 

 We need channel id and channel name in the notification, here  "flutter-tut" is 
channel id and "flutter tutorial" is channel name. 

You can give whatever name you wish to give.


*/

// ****** Andriod Configuration ******

    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'channelId', 'channelName',
      playSound: true,
      actions: [AndroidNotificationAction('ActionId', 'Copy', showsUserInterface: true)],
// Higher the Priority and Importance,
// will result in high visibility of notification

      priority: Priority.max,
      importance: Importance.max,
    );

// ****** iOS Configuration : with the necessary requirements ******

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBanner: true,
      presentBadge: true,
    );

    /// let's combine both details.

    NotificationDetails noti = NotificationDetails(iOS: darwinNotificationDetails, android: androidNotificationDetails);

    /* 

This line will show the notification, after all the configuration is done
 
Passing the payload is totally option. However if your want to navigate to a 
particular screen on click of the notification of perform certain action. Payload
become crutial. 

*/

    await flutterLocalNotificationsPlugin.show(0, title, body, noti, payload: payload);
    // flutterLocalNotificationsPlugin.getActiveNotifications();
  }
}
