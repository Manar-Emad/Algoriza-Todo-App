import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/sizes.dart';

/// Button
class DefaultButton extends StatelessWidget {
  final Function() onTap;
  final String text;
   const DefaultButton({Key? key, required this.onTap,
     required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Container(
        width: double.infinity,
        height: getHeight(context)/16,
        clipBehavior:Clip.antiAliasWithSaveLayer ,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: MaterialButton(
          onPressed:
            onTap,
           child: Text(text,style:const TextStyle(
            fontSize: 16.0,
            color: defTextColor,
          ) ,
           ),
        ),
      ),
    );
  }
}

/// OutLined Button
class MyOutlinedButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const MyOutlinedButton({Key? key,
    required this.onTap,
    required this.text,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getHeight(context)/14,
      clipBehavior:Clip.antiAliasWithSaveLayer ,
      decoration:  BoxDecoration(
          border: Border.all(color: buttonColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: MaterialButton(
        onPressed:
        onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context)/29,
              width: getWidth(context)/8,
              child:const Image(image: AssetImage('assets/images/google.png')),
            ),
            Text(text,style: const TextStyle(color: buttonColor,fontSize: 18.0,
              fontWeight: FontWeight.bold,),),
          ],
        ),
      ),
    );
  }
}
