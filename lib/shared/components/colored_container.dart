import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/styles/sizes.dart';
import 'package:todo/shared/styles/styles.dart';

import '../styles/colors.dart';

class ColoredContainer extends StatelessWidget {
   ColoredContainer({Key? key,this.model2}) : super(key: key);
Map? model2;
List<int>index=[0,1,2,3];
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: getHeight(context)/10,
          clipBehavior:Clip.antiAliasWithSaveLayer ,
          decoration:  BoxDecoration(
            color:  AppCubit.get(context).changeContainerColor(index),
            borderRadius: BorderRadius.circular(10),
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 10),
                    child: Text('${model2!['tstart']}',style: white12bold(),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('${model2!['title']}',style: white12bold(),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.check_circle_outline,color: defTextColor.withOpacity(.7),size: 20,),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: getHeight(context)/10,
        clipBehavior:Clip.antiAliasWithSaveLayer ,
        decoration:  BoxDecoration(
          color:  Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 10),
                  child: Text('${model2!['tstart']}',style: white12bold(),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('${model2!['title']}',style: white12bold(),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.check_circle_outline,color: defTextColor.withOpacity(.7),size: 20,),
            ),
          ],
        ),
      )
    ],);
    //   ConditionalBuilder(
    //   condition: AppCubit.get(context).tasks.isNotEmpty,
    //   builder: ( context) =>Column(
    //     children: [
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 10),
    //           child: ListView.builder(
    //               itemBuilder: (context, index) =>Container(
    //                 width: double.infinity,
    //                 height: getHeight(context)/10,
    //                 clipBehavior:Clip.antiAliasWithSaveLayer ,
    //                 decoration:  BoxDecoration(
    //                   color:  Colors.amber,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child:Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 10),
    //                           child: Text('${model2!['tstart']}',style: white12bold(),),
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.symmetric(horizontal: 10),
    //                           child: Text('${model2!['title']}',style: white12bold(),),
    //                         ),
    //                       ],
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 10),
    //                       child: Icon(Icons.check_circle_outline,color: defTextColor.withOpacity(.7),size: 20,),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               itemCount: AppCubit.get(context).tasks.length),
    //
    //         ),
    //       ),
    //     ],
    //   ),
    //   fallback:(context) =>Center(
    //     child:Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Icon(Icons.menu,size: 60,color: greyColor,),
    //         Text('No Tasks Yet , Please Add Some Tasks', style:grey16bold() ,),
    //       ],)  ,
    //   ),
    // );
   // TextButton(onPressed: (){print('length${AppCubit.get(context).tasks.length}');}, child: Text('mmm')),

  }
}
