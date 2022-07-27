import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/sizes.dart';

class MyFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final bool obSecure;
   bool isClikable;
  final TextInputType keyboardType;
  final String textValidate;
  final String hintText;
  Function()? onTap;
  Function()? clicked;
  IconData? suffixIcon;
  Color? suffixColor;
  Widget? widget;
  Function? validateFunction;
  MyFormFeild({
    Key? key,
    required this.controller,
     this.isClikable=true,
    this.obSecure = false,
    this.keyboardType = TextInputType.text,
    required this.textValidate,
    required this.hintText,
    this.onTap,
    this.clicked,
    this.suffixIcon,
    this.suffixColor,
    this.widget,
    this.validateFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context)/12,
      child: InkWell(
        onTap: clicked,
        child: TextFormField(
          enabled: isClikable,
          decoration: InputDecoration(
            filled: true,
            fillColor: greyColor.withOpacity(.06),
            prefixIcon: widget,
            hintText: hintText,
            hintStyle: TextStyle(color:greyColor.withOpacity(.5),fontSize: 14),
            suffixIcon: GestureDetector(
              onTap: onTap,
              child: Icon(
                suffixIcon,
                color: suffixColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.01),
              width: 2.0,
            ),
          ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(.01),
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(borderSide: BorderSide(
              color: Colors.grey.withOpacity(.01),
              width: 2.0,
            ) ,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          obscureText: obSecure,
          keyboardType: keyboardType,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              validateFunction!();
              return textValidate;
            }
            return null;
          },
        ),
      ),
    );
  }
}
