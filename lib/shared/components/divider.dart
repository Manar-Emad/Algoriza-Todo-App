


import 'package:flutter/material.dart';
import 'package:todo/shared/styles/sizes.dart';
import 'package:todo/shared/styles/styles.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.50,
      color: Colors.grey[300],
    );
  }
}

class RowDivider extends StatelessWidget {
  const RowDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Row(
        children: [
          const MyDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Or',style:grey14regular()),
          ),
          const MyDivider(),
        ],
      ),
    );
  }
}
