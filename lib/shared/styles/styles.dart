import 'package:flutter/material.dart';
import 'colors.dart';
///BlackText
TextStyle blackText() => const TextStyle(
  color:secondColor,
);
/// blackBold Style
TextStyle black24bold() => const TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color:secondColor,
);
TextStyle black22bold() => const TextStyle(
    fontSize: 22.0,
   fontWeight: FontWeight.bold,
   color:secondColor,
 );
TextStyle black20bold() => const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color:secondColor,
);
TextStyle black18bold() => const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black
);
TextStyle black16bold() => const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black
);
TextStyle black14bold() => const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black
);


TextStyle black16regular() => const TextStyle(
    fontSize: 16.0,
    color: Colors.black
);
TextStyle black14regular() => const TextStyle(
    fontSize: 14.0,
    color: Colors.black
);
/// grey regular Style
TextStyle grey14regular() => const TextStyle(
  fontSize: 14.0,
  color:greyColor,
);
TextStyle grey12regular() => const TextStyle(
  fontSize: 12.0,
  color:greyColor,

);TextStyle grey16regular() => const TextStyle(
  fontSize: 16.0,
  color:greyColor,
);

/// grey bold Style
TextStyle grey14bold() => const TextStyle(
  fontSize: 14.0,
  color:greyColor,
  fontWeight: FontWeight.bold
);
TextStyle grey16bold() => const TextStyle(
    fontSize: 16.0,
    color:greyColor,
    fontWeight: FontWeight.bold
);


///white style
TextStyle white14bold() => const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: defTextColor,
);
TextStyle white12bold() => const TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: defTextColor,
);

///MaxLines Style
Text txtMaxLines1(String txt) =>  Text(txt,
  maxLines: 1 ,overflow: TextOverflow.ellipsis,
);

Text txtMaxLinesB1(String txt) =>  Text(txt,style: const TextStyle(
    fontWeight: FontWeight.bold,fontSize: 12),
  maxLines: 1 ,overflow: TextOverflow.ellipsis,
);
