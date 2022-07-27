import 'package:flutter/material.dart';
import 'package:todo/shared/components/navigate.dart';

class RowText extends StatelessWidget {
  final Widget widget;
  final String text;
  final String textButton;
  final TextStyle textStyle;
  final TextStyle textStyle2;
  const RowText({Key? key, required this.widget, required this.text, required this.textButton, required this.textStyle, required this.textStyle2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: textStyle2,),
        TextButton(onPressed: (){
          navigateTo(context, widget);
        }, child: Text(textButton,style:textStyle),),
      ],
    );
  }
}
