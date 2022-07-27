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


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.model!['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Row(
          children: [
            widget.model!['status']=="completed"? Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: getColor(widget.model!['color']),
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
                border: Border.all(color: getColor(widget.model!['color'])),
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
                      AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                      Navigator.pop(context);
                  debugPrint('complete task');
                    },
                    child: Text('Completed',style: grey16regular(),),
                  )),
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).updateData(status: 'unCompleted', id:widget.model!['id'] );
                      AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                      Navigator.pop(context);
                      debugPrint('unCompleted task');
                      },
                    child:  Text('UnCompleted',style: grey16regular()),
                  )),
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).updateData(fav: 'favourite', id:widget.model!['id'] );
                      AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                      Navigator.pop(context);
                      debugPrint('Favourite task');
                    },
                    child:  Text('Favourite',style: grey16regular()),
                  )),
                  PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(fav: 'unfavourite', id:widget.model!['id'] );
                          AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                          Navigator.pop(context);
                          debugPrint('unFavourite task');
                        },
                        child:  Text('unFavourite',style: grey16regular()),
                      )),
                  PopupMenuItem(
                      child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).deleteData(id: widget.model!['id']);
                      AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
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


Color getColor(String color){
  if(color == "amber") {
    return Colors.amber;
  }
  else if(color=="blue"){
    return Colors.blue;
  }else if(color=="teal"){
    return Colors.teal;
  }else if(color=="red")
  {return Colors.red;
  }else{return Colors.black;}
}