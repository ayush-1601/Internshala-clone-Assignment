import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/custom_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color textColor, buttonColor;
  final double height;
  final double width;
  final bool border;
  final Function() onPress;
  ButtonWidget(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      required this.height,
      required this.width,
      required this.border,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        // width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(5),
            border: border
                ? Border.all(color: CustomColor().blue, width: 2)
                : Border()),
        child: Center(
            child: Text(
          text.toString(),
          style: TextStyle(
              fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
