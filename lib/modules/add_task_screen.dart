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

  late String _chosenValue;
  late String taskColor="";

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
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
                        MyFormFeild(
                          controller: reminderController,
                          textValidate: 'please enter remind time',
                          validateFunction: () {},
                          hintText: ' 10 minutes early',
                          suffixIcon: Icons.keyboard_arrow_down,
                          //isClikable: false,

                          onTap: () {
                            // DropdownButton(items: [
                            //   DropdownMenuItem(child: Text('5 min')),
                            //   DropdownMenuItem(child: Text('10 min')),
                            //   DropdownMenuItem(child: Text('15 min')),
                            //   DropdownMenuItem(child: Text('20 min')),
                            // ],
                            //   onChanged:(){
                            //
                            //   },);
                            ///---------------------------------------------
                            // DropdownButton<String>(
                            //   focusColor:Colors.white,
                            //   value: _chosenValue,
                            //   //elevation: 5,
                            //   style: const TextStyle(color: Colors.white),
                            //   iconEnabledColor:Colors.black,
                            //   items: <String>[
                            //     '5 min',
                            //     '10 min',
                            //     '15 min',
                            //   ].map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value,style:const TextStyle(color:Colors.black),),
                            //     );
                            //   }).toList(),
                            //   hint:const Text(
                            //     "10 min",
                            //     style:  TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            //   onChanged: (value) {
                            //     // setState(() {
                            //     //   _chosenValue = value;
                            //     // });
                            //   },
                            // );
                          },
                          suffixColor: greyColor.withOpacity(.5),
                          // isClikable: false,
                          clicked: () {
                            ///انا كدا بعملها ان لما يضغط عليه يظهر الاشعارات رغم اني عاوزة ان لما اليوزر يدخل وقت معين
                            // Notifications.showNotification(
                            //   title: 'New Notification',
                            //     body: 'mmm',
                            //   //model!['title']
                            //   payload: '',
                            // );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Repeat',
                            style: black14bold(),
                          ),
                        ),
                        MyFormFeild(
                          controller: repeatController,
                          textValidate: 'please enter task date',
                          validateFunction: () {},
                          hintText: ' weekly',
                          suffixIcon: Icons.keyboard_arrow_down,
                          suffixColor: greyColor.withOpacity(.5),
                        ),
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
                        await  snackBar("Please choose color",context);
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
