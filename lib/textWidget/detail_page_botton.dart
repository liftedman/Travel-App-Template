import 'package:flutter/material.dart';
import 'package:hiking_travel/textWidget/text_widget.dart';

// ignore: must_be_immutable
class DetailPageButton extends StatelessWidget {
  final Color color;
  final String? text;
  double size;
  Color backgroundColor;
  Color borderColor;
  final IconData? icons;
  bool isIcon;

  DetailPageButton(
      {super.key,
      this.isIcon = false,
      this.icons,
      this.text,
      required this.color,
      required this.size,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: isIcon == false
          ? TextWidget(
              text: text!,
              color: color,
              size: 20,
            )
          : Icon(icons, color: color,),
    );
  }
}
