import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.isTextAlignCenter = true,
    required this.color,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final bool isTextAlignCenter;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.left,
      style: TextStyle(
        fontFamily: 'Montserrat',
        // letterSpacing: 2,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
