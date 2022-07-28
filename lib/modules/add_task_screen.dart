import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/modules/board_screen.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/components/buttons.dart';
import 'package:todo/shared/components/form_feild.dart';
import 'package:todo/shared/components/navigate.dart';
import 'package:todo/shared/components/snack_bar.dart';
import 'package:todo/shared/styles/sizes.dart';
import 'package:todo/shared/styles/styles.dart';

import '../shared/components/divider.dart';
import '../shared/styles/colors.dart';
import 'notification/local_notification_serices.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key, this.model,}) : super(key: key);
  Map? model;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var reminderController = TextEditingController();
  var repeatController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  late String taskColor="";

  late final LocalNotificationService service;
  var index;
  @override
  void initState() {
    service=LocalNotificationService();
  //  listenToNotification();
    service.inialize();
    super.initState();
  }

  String dropdownValue = ' 10 minutes early';
  List items = ['5 min early', '10 min early', '15 min early', '20 min early'];
  String selectedValue = '5 min early';

  List items2 =['daily', 'weekly', 'monthly'];
  String selectedValue2 = 'daily';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){
        if (state is AppInsertDatabaseState) {
          print("manar before navigate");
          navigateTo(context, const BoardScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 20, right: 10, left: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 13,
                          color: secondColor,
                        ),
                        onPressed: () {
                          navigateTo(context, const BoardScreen());
                        },
                      ),
                      Text(
                        'Add task',
                        style: black18bold(),
                      ),
                    ],
                  ),
                ),
                const MyDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            'Title',
                            style: black14bold(),
                          ),
                        ),
                        MyFormFeild(
                            controller: titleController,
                            textValidate: 'please enter task title',
                            keyboardType: TextInputType.text,
                            validateFunction: () {},
                            hintText: ' Design team meeting'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Date',
                            style: black14bold(),
                          ),
                        ),
                        MyFormFeild(
                          controller: dateController,
                          textValidate: 'please enter task date',
                          validateFunction: () {},
                          isClikable: false,
                          clicked: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-10-17'))
                                .then((value) {
                              debugPrint("ewewe ${DateFormat("yyyy-MM-dd").format(value!)}");
                              dateController.text = DateFormat("yyyy-MM-dd").format(value);
                            });
                          },
                          hintText: ' 28-02-2021',
                          suffixIcon: Icons.keyboard_arrow_down,
                          suffixColor: greyColor.withOpacity(.5),
                        ),
                        SizedBox(
                          height: getHeight(context) / 7,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 5),
                                      child: Text(
                                        'Start time',
                                        style: black14bold(),
                                      ),
                                    ),
                                    MyFormFeild(
                                      controller: startTimeController,
                                      clicked: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          startTimeController.text =
                                              value!.format(context).toString();
                                          debugPrint(value.format(context));
                                        });
                                      },
                                      isClikable: false,
                                      textValidate:
                                          'please enter task start time',
                                      validateFunction: () {},
                                      hintText: ' 11:00 Am',
                                      suffixIcon: Icons.timer_outlined,
                                      suffixColor: greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                flex: 3,
                                child: SizedBox(
                                  width: 1,
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 5),
                                      child: Text(
                                        'End time',
                                        style: black14bold(),
                                      ),
                                    ),
                                    MyFormFeild(
                                      controller: endTimeController,
                                      clicked: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          endTimeController.text =
                                              value!.format(context).toString();
                                          debugPrint(value.format(context));
                                        });
                                      },
                                      isClikable: false,
                                      textValidate:
                                          'please enter task end time',
                                      validateFunction: () {},
                                      hintText: ' 14:00 Pm',
                                      suffixIcon: Icons.timer_outlined,
                                      suffixColor: greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Remind',
                            style: black14bold(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:  greyColor.withOpacity(.06),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const Icon( Icons.keyboard_arrow_down,size: 23,),
                                focusColor:  greyColor.withOpacity(.06),
                                   iconEnabledColor: greyColor,
                                   iconDisabledColor: greyColor,
                                value: selectedValue,
                                hint:Text(' 10 minutes early'),
                                underline: SizedBox(),
                                onChanged: (String? newValue) =>
                                    setState(() => selectedValue = newValue!),
                                items: items
                                    .map<DropdownMenuItem<String>>(
                                        (dynamic value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                    .toList(),
                                iconSize: 42,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Repeat',
                            style: black14bold(),
                          ),
                        ),
                  Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  greyColor.withOpacity(.06),
                    ),
                         child:Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 7),
                           child: DropdownButton<String>(
                                  dropdownColor: defTextColor,
                                  isExpanded: true,
                                  focusColor:  greyColor.withOpacity(.06),
                                  underline: SizedBox(),
                                  borderRadius:BorderRadius.circular(10) ,
                                  hint:Text('weekly'),
                                  iconEnabledColor: greyColor,
                                  iconDisabledColor: greyColor,
                                  value:  selectedValue2 ,
                                  icon: const Icon( Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style: const TextStyle(color: secondColor),
                                  onChanged: (String? newValue) {

                                    setState(() {
                                      selectedValue2  = newValue!;
                                    });
                                  },
                                  items: items2
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                         ),
                  )

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.circle,
                            color: amber,size: 40,
                          ),
                          onTap: () {
                            setState((){
                              taskColor = "amber";
                            });
                            print('Color----');
                           // AppCubit.get(context).changeContainerColor(0);
                          },
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.circle,
                            color: blue,size: 40,
                          ),
                          onTap: () {
                            setState((){
                              taskColor = "blue";
                            });
                          //  AppCubit.get(context).changeContainerColor(1);
                          },
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.circle,
                            color: teal,size: 40,
                          ),
                          onTap: () {
                            setState((){
                              taskColor = "teal";
                            });
                           // AppCubit.get(context).changeContainerColor(2);
                          },
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.circle,
                            color: red,size: 40,
                          ),
                          onTap: () {
                            setState((){
                              taskColor = "red";
                            });

                         //   AppCubit.get(context).changeContainerColor(3);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                DefaultButton(
                    onTap: ()async {
                      await service.showScheduledNotification(
                        id: 0,
                        //AppCubit.get(context).Scudeling[index]['id'],
                        title:titleController.text,
                        //'${AppCubit.get(context).Scudeling[index]['title']}',
                        body: '',
                        seconds: 4,
                      );
                      if (formKey.currentState!.validate()) {
                        if(taskColor!=''){
                        print('before ');
                        AppCubit.get(context).insertToDatabase(
                          context,
                          title: titleController.text,
                          date: dateController.text,
                          tstart: startTimeController.text,
                          tend: endTimeController.text,
                          repeat: repeatController.text,
                          reminder: reminderController.text,
                          taskColor: taskColor,
                        );
                        print("asdasd asd asd ${titleController.text}");
                        print(dateController.text);

                        debugPrint('data${AppCubit.get(context).database}');
                        debugPrint('data${AppCubit.get(context).tasks}');
                      }}else {
                        snackBar("Please choose color",context);
                      }

                    },
                    text: 'Create a task'),
              ],
            ),
          ),
        );
      },
    );
  }
}
