import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String asset;
  final Color? color;
  final double height;
  final double width;

  const SvgImage(this.asset,
      {this.color, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      color: color,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
