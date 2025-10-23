import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart';

class GradientTextOnHover extends StatefulWidget {
  final String text;
  final double normalSize;
  final double hoverSize;

  const GradientTextOnHover({
    Key? key,
    required this.text,
    this.normalSize = 40,
    this.hoverSize = 60,
  }) : super(key: key);

  @override
  _GradientTextOnHoverState createState() => _GradientTextOnHoverState();
}

class _GradientTextOnHoverState extends State<GradientTextOnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Text("${widget.text}",style:AppTextStyles.KjosefinSansRegular.copyWith(fontSize: widget.normalSize));
  }

  
}
