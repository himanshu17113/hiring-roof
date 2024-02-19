import 'dart:convert';
import 'package:hiring_roof/util/apistring.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:hiring_roof/util/constant/const.dart';

import 'package:get/get.dart';

import '../../model/notification.dart';

class SocketController extends GetxController {
  List<Notifications> notifications = [];
  IO.Socket socket = IO.io(ApiString.notificationHistory(userModal.userId!), <String, dynamic>{
    'transports': ['websocket'],
  });

  void getNotification() {
    socket.connect();
    socket.onConnect((_) {
      socket.emit("notificationHistory", userModal.userId!);
      socket.on("notificationHistory_${userModal.userId!}", (payload) {
        print(jsonEncode(payload).toString());
        for (var payloadx in payload) {
          notifications.add(Notifications.fromJson(payloadx));
        }
        update(["dot"]);
      });
      update(["dot"]);
      socket.on("notifications_${userModal.userId!}", (payload) {
        print(jsonEncode(payload).toString());

        notifications.insert(0, Notifications.fromJson(payload));
        //   print(notifications[0].message.toString());
        update(["dot"]);
      });
      update(["dot"]);
    });
  }
  //   Future<bool> clearAllNotification() async {
  //   try {
  //     String url = ApiEndpoint.clearAllNotification(userId!);

  //     debugPrint(url);
  //     http.Response response = await client.get(
  //       Uri.parse(url),
  //       headers: header,
  //     );

  //     debugPrint(response.toString());
  //     debugPrint(url);

  //     debugPrint('Response Code: ${response.body}');
  //     debugPrint(response.statusCode.toString());

  //     if (response.statusCode == 200) {
  //       update(["dot"]);
  //       notifications.clear();
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return false;
  //   }
  // }

}
