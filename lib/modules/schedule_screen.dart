import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
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
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var tasks=AppCubit.get(context).tasks;
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
        child:   HorizontalCalendar(
          date: DateTime.now(),
          textColor: Colors.black45,
          backgroundColor: Colors.white,
          selectedColor: Colors.blue,
          onDateSelected: (date) => print(
            date.toString(),
          ),
        ),
        // DatePicker(
        //   DateTime.now(),
        //   width: 50,
        //   height: 76,
        //   controller: _controller,
        //   initialSelectedDate: DateTime.now(),
        //   selectionColor: buttonColor,
        //   selectedTextColor: Colors.white,
        //   inactiveDates: [DateTime.now().add(Duration(days: 7)),],
        //
        //   onDateChange: (date) {
        //     AppCubit.get(context).getDataFromByDataBase(AppCubit.get(context).database);
        //
        //     // New date selected
        //     setState(() {
        //       _selectedValue = date;
        //     });
        //   },
        // ),
      ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
          Text(DateFormat('EEEE').format(DateTime.now()).toString(),
          style: black14regular(),
          ),
                      Text(DateFormat('dd MMMM yyyy').format(DateTime.now()).toString(),
                        style: black14regular(),
                      ),
                  ],),
                  const SizedBox(height: 10,),
                  RefreshIndicator(
                    onRefresh: () async {
                      AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                    },
                    child: ColoredContainer(
                          model2: tasks[0],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  },
);
  }
}

