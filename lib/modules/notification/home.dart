import 'package:flutter/material.dart';
import 'package:todo/modules/notification/local_notification_serices.dart';
import 'package:todo/modules/notification/second_screen.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/components/navigate.dart';

class NotificationHome extends StatefulWidget {
  const NotificationHome({Key? key,}) : super(key: key);

  @override
  State<NotificationHome> createState() => _NotificationHomeState();
}

class _NotificationHomeState extends State<NotificationHome> {
  late final LocalNotificationService service;
  var index;
@override
  void initState() {
service=LocalNotificationService();
listenToNotification();
service.inialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: SizedBox(height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                const Text('Local Notification'),
              ElevatedButton(
                  onPressed: ()async{
                    await service.showNotification(
                        id: 0,
                        //AppCubit.get(context).Scudeling[index]['id'],
                        title: 'ttttttttttttttttttt',
                        //'${AppCubit.get(context).Scudeling[index]['title']}',
                        body: '');
                  },
                  child: const Text('Show Local Notification')),
                ElevatedButton(
                    onPressed: ()async{
                      await service.showScheduledNotification(
                          id: 0,
                          //AppCubit.get(context).Scudeling[index]['id']
                          title:'time now no',
                        //  '${AppCubit.get(context).Scudeling[index]['title']}',
                          body: '',
                        seconds: 4,
                      );
                    },
                    child: const Text('Show Scheduled Notification')),
                ElevatedButton(
                    onPressed: ()async{
                      await service.showNotificationWithPayload(
                          id: 0,
                          //AppCubit.get(context).Scudeling[index]['id'],
                          title: 'ttttttttttttttttttt',
                          //'${AppCubit.get(context).Scudeling[index]['title']}',
                          body: '',
                      payload: 'payload notification'
                      );
                    },
                    child: const Text('Show Notification with Payload')),
              ],
            ),
            ),
          ),
        ),

      ),
    );
  }
  void listenToNotification()=>service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
   if (payload !=null && payload.isNotEmpty){
      debugPrint('payload=====$payload');
      navigateTo(context, SecondScreen(payload:payload));
    }
  }
}
