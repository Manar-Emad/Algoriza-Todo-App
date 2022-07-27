import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/components/colored_container.dart';
import 'package:todo/shared/components/divider.dart';
import 'package:todo/shared/components/navigate.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/styles.dart';

import 'board_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final DatePickerController _controller = DatePickerController();
   DateTime _selectedValue = DateTime.now();
  final f =  DateFormat('yyyy-MM-dd hh:mm');

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getDataFromByDataBaseSchedaling(DateFormat("yyyy-MM-dd").format(DateTime.now()));
  }
  @override
  Widget build(BuildContext context) {
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
                      navigateTo(context,  BoardScreen());
                    },
                  ),
                  Text(
                    'Schedule',
                    style: black18bold(),
                  ),
                ],
              ),
            ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:
              DatePicker(
                DateTime.now(),
                width: 50,
                height: 76,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: buttonColor,
                selectedTextColor: Colors.white,
                inactiveDates: [DateTime.now().add(Duration(days: 7)),],

                onDateChange: (date) {
                  String zero = (date.month == "10"  || date.month == "11" ||date.month == "12")?"":"0";
                  print("werwer wer  --> ${date.year}-0${date.month}-${date.day}");
                  AppCubit.get(context).getDataFromByDataBaseSchedaling("${date.year}-${zero}${date.month}-${date.day}");

                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
            ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('EEEE').format(_selectedValue).toString(),
                        style: black14regular(),),
                      Text(DateFormat('dd MMMM yyyy').format(_selectedValue).toString(),
                        style: black14regular(),
                      ),
                    ],),
                  const SizedBox(height: 10,),
                  RefreshIndicator(
                    onRefresh: () async {
                      AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                    },
                    child: SizedBox(
                        height: 400,
                        child: ColoredContainer()),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

