
import 'dart:ui';

import 'package:flutter/material.dart';

class Utils{
  double measureTextWidth(String t,TextStyle style,BuildContext context){
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: t,style: defaultTextStyle.style.merge(style)),
        maxLines: 1,textDirection: TextDirection.ltr
    )..layout(minWidth: 0,maxWidth: double.infinity);
    return textPainter.size.width;
  }
}