import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/components/user_item.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/styles.dart';

class TasksBuilder extends StatelessWidget {
   const TasksBuilder({Key? key, required this.tasks}) : super(key: key);
final List<Map>tasks;
  @override
  Widget build(BuildContext context) {
    print("task eee${tasks.length}");
    return ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    TaskItem(model: tasks[index]),
                itemCount: tasks.length),
          ),
        ),
      ],),
      fallback: (context) =>  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.menu,size: 60,color: greyColor,),
            Text('No Tasks Yet , Please Add Some Tasks', style:grey16bold() ,),
          ],)  ,
      ),
    );
  }
}
