import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/components/user_item.dart';
import 'package:todo/shared/styles/sizes.dart';
import 'package:todo/shared/styles/styles.dart';

import '../styles/colors.dart';

class ColoredContainer extends StatelessWidget {
   ColoredContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit, AppStates>(
  builder: (context, state) {
    if (state is getScedualingLoading){
      return CircularProgressIndicator();
    }
    else {
      return ConditionalBuilder(
        condition:AppCubit.get(context).Scudeling .isNotEmpty,
        builder: (context) => Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                  itemBuilder: (context, index) =>
                      Container(
                        width: double.infinity,
                        height: getHeight(context)/10,
                        margin: EdgeInsets.all(8),
                        clipBehavior:Clip.antiAliasWithSaveLayer ,
                        decoration:  BoxDecoration(
                          color: getColor(AppCubit.get(context).Scudeling[index]["color"]),
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
                                  child: Text('${AppCubit.get(context).Scudeling[index]['tstart']}',style: white12bold(),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('${AppCubit.get(context).Scudeling[index]['title']}',style: white12bold(),),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.check_circle_outline,color: defTextColor.withOpacity(.7),size: 20,),
                            ),
                          ],
                        ),
                      ) ,
                  itemCount: AppCubit.get(context).Scudeling.length),
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

  },
);


  }
}


