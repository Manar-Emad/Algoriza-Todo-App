// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class Notificationsss extends StatefulWidget {
//   Notificationsss({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _NotificationsssState createState() => _NotificationsssState();
// }
//
// class _NotificationsssState extends State<Notificationsss> {
//
//   late FlutterLocalNotificationsPlugin flutterNotificationPlugin;
//
//   @override
//   void initState() {
//
//     var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
//
//     var initializationSettingsIOS = const IOSInitializationSettings();
//
//     var initializationSettings =  InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
//
//     flutterNotificationPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//
//
//   }
//
//   Future onSelectNotification(String payload) async{
//     showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text(
//               "Hello Everyone"
//           ),
//           content: Text(
//               "$payload"
//           ),
//         )
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 child: const Text(
//                     "Notification with Default Sound"
//                 ),
//                 onPressed: () {
//                   notificationDefaultSound();
//                 },
//               ),
//
//               RaisedButton(
//                 child: const Text(
//                     "Notification without Sound"
//                 ),
//                 onPressed: () {
//                   notificationNoSound();
//                 },
//               ),
//
//               RaisedButton(
//                 child: const Text(
//                     "Notification with Custom Sound"
//                 ),
//                 onPressed: () {
//                   notificationCustomSound();
//                 },
//               ),
//
//               RaisedButton(
//                 child: const Text(
//                   "Scheduled",
//                 ),
//                 onPressed: () {
//                   notificationScheduled();
//                 },
//               )
//             ],
//           )
//       ),
//     );
//   }
//
//
//   Future notificationDefaultSound() async{
//
//     var androidPlatformChannelSpecifics =
//     const AndroidNotificationDetails(
//       'Notification Channel ID',
//       'Channel Name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     var iOSPlatformChannelSpecifics =
//     const IOSNotificationDetails();
//
//     var platformChannelSpecifics =
//     NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics
//     );
//
//     flutterNotificationPlugin.show(
//         0,
//         'New Alert',
//         'How to show Local Notification',
//         platformChannelSpecifics,
//         payload: 'Default Sound'
//     );
//   }
//
//   Future notificationNoSound() async {
//
//     var androidPlatformChannelSpecifics =
//     const AndroidNotificationDetails(
//       'Notification Channel ID',
//       'Channel Name',
//       playSound: false,
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     var iOSPlatformChannelSpecifics =
//     const IOSNotificationDetails(
//         presentSound: false
//     );
//
//     var platformChannelSpecifics =
//     NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics
//     );
//
//     flutterNotificationPlugin.show(
//         0,
//         'New Alert',
//         'How to show Local Notification',
//         platformChannelSpecifics,
//         payload: 'No Sound'
//     );
//
//
//   }
//
//   Future<void> notificationCustomSound() async{
//
//     var androidPlatformChannelSpecifics =
//     const AndroidNotificationDetails(
//       'Notification Channel ID',
//       'Channel Name',
//       // sound: 'slow_spring_board',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     var iOSPlatformChannelSpecifics =
//     const IOSNotificationDetails(
//         sound: 'slow_spring_board.aiff'
//     );
//
//     var platformChannelSpecifics =
//     NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics
//     );
//
//     flutterNotificationPlugin.show(
//         0,
//         'New Alert',
//         'How to show Local Notification',
//         platformChannelSpecifics,
//         payload: 'Custom Sound'
//     );
//
//   }
//
//   Future<void> notificationScheduled() async {
//     int hour = 19;
//     var ogValue = hour;
//     int minute = 05;
//
//     var time = Time(hour,minute,20);
//
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'repeatDailyAtTime channel id',
//       'repeatDailyAtTime channel name',
//       importance: Importance.max,
//       // sound: 'slow_spring_board',
//       ledColor:  Color(0xFF3EB16F),
//       ledOffMs: 1000,
//       ledOnMs: 1000,
//       enableLights: true,
//     );
//     var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
//
//     await flutterNotificationPlugin.showDailyAtTime(4, 'show daily title',
//       'Daily notification shown',time, platformChannelSpecifics,payload: "Hello",);
//
//     debugPrint('Set at '+time.minute.toString()+" +"+time.hour.toString());
//
//
//   }
// }