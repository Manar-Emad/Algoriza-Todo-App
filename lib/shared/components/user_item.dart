import 'package:flutter/material.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/styles.dart';

class TaskItem extends StatefulWidget {
     TaskItem({Key? key,  this.model}) : super(key: key);
 Map? model;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
bool isUnCompeleted=true;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.model!['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Row(
          children: [
            isUnCompeleted? Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(
                  7.0,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: defTextColor,
                size: 15,
              ),
            ):
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(
                  7.0,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
             Expanded(
                child: Text(
              '${widget.model!['title']}',
              style: const TextStyle(
                fontSize: 16,color: secondColor,
              ),
            )),
            PopupMenuButton(
              elevation: 5,
              //onCanceled:(){Navigator.pop(context);} ,
           //   onSelected:(){Navigator.pop(context);} ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).updateData(status: 'completed', id:widget.model!['id'] );
                 Navigator.pop(context);
                  debugPrint('complete task');
                    },
                    child: Text('Completed',style: grey16regular(),),
                  )),
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).updateData(status: 'unCompleted', id:widget.model!['id'] );
                      Navigator.pop(context);
                      debugPrint('unCompleted task');
                      },
                    child:  Text('UnCompleted',style: grey16regular()),
                  )),
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).updateData(status: 'Favourite', id:widget.model!['id'] );
                      setState((){
                        isUnCompeleted=!isUnCompeleted;
                      });
                      Navigator.pop(context);
                      debugPrint('Favourite task');
                    },
                    child:  Text('Favourite',style: grey16regular()),
                  )),
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).deleteData(id: widget.model!['id']);
                      Navigator.pop(context);
                      debugPrint('delete task');
                    },
                    child:  Text('Delete',style: grey16regular()),
                  )),
                ];
              },
            ),
          ],
        ),
      ),
      onDismissed: (direction){
      AppCubit.get(context).deleteData(id: widget.model!['id']);
      },
    );
  }
}
