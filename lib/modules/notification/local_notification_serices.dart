import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:rxdart/subjects.dart';

class LocalNotificationService{
 LocalNotificationService();
 final _localNotificationService=FlutterLocalNotificationsPlugin();
 final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

 Future<void>inialize()async{
   tz.initializeTimeZones();
   const AndroidInitializationSettings androidInitializationSettings=
   AndroidInitializationSettings('todoaa');

    IOSInitializationSettings iosInitializationSettings=IOSInitializationSettings(
     requestSoundPermission: true,
     requestBadgePermission: true,
     requestAlertPermission: true,
     onDidReceiveLocalNotification: _onDidReceiveLocalNotification
   );
    final InitializationSettings settings=InitializationSettings(
        android: androidInitializationSettings,
        iOS:iosInitializationSettings);
    
    await _localNotificationService.initialize(
      settings,onSelectNotification: onSelectedNotification,);
 }
 Future<NotificationDetails>_notificationDetails()async{
   const AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
       'channel_id', 'channel_name',
       channelDescription:'description',
        importance: Importance.max,
     priority: Priority.max,
     playSound: true,
   );
   const IOSNotificationDetails iosNotificationDetails=
   IOSNotificationDetails();
return NotificationDetails(android: androidNotificationDetails,iOS: iosNotificationDetails);

 }
///Notifications
 Future<void> showNotification({
  required int id,
   required String title,
   required String body,
})async{
   final details =await _notificationDetails();
   await _localNotificationService.show(id, title, body, details);
 }

 ///Scheduled Notifications
 Future<void> showScheduledNotification({
   required int id,
   required String title,
   required String body,
   required int seconds,
 })async{
   final details =await _notificationDetails();
   await _localNotificationService.zonedSchedule(
       id,
       title,
       body,
       tz.TZDateTime.from(DateTime.now().add(Duration(seconds: seconds)),tz.local),
     details,
       androidAllowWhileIdle: true,
     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
   );
 }
 Future<void> showScheduledNotificationWithDate({
   required int id,
   required String title,
   required String body,
   required int seconds,
    required DateTime dateTime,
 })async{
   final details =await _notificationDetails();
   await _localNotificationService.zonedSchedule(
     id,
     title,
     body,
     tz.TZDateTime.from(dateTime,tz.local),
     details,
     androidAllowWhileIdle: true,
     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
   );
 }


 ///showNotificationWithPayload
 Future<void> showNotificationWithPayload({
   required int id,
   required String title,
   required String body,
   required String payload,
 })async{
   final details =await _notificationDetails();
   await _localNotificationService.show(id, title, body, details,payload: payload);
 }


  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
   debugPrint('id==$id');
  }

  void onSelectedNotification(String? payload) {
   debugPrint('payload==$payload');
   if(payload!=null&& payload.isNotEmpty){
     onNotificationClick.add(payload);
   }
  }
}