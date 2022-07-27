import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications{
 static final _notifications = FlutterLocalNotificationsPlugin();

 static Future _notificationDetails()async{
   return NotificationDetails(
   android: AndroidNotificationDetails(
     'channel id',
     'channel name',
    // 'channel description'
     importance: Importance.max,
     ///TODO reminder time from user
     when: 5,
     playSound: true,
    // sound: AndroidNotificationSound(),
     enableVibration: true,
   ),
   iOS: IOSNotificationDetails(),
   );
}

 static Future showNotification({
  int id=0,
   String? title,
   String? body,
   String? payload,

})async=>_notifications.show(id, title, body, await _notificationDetails(),payload: payload);

}