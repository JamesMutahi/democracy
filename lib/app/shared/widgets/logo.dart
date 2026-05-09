import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/shield.svg',
      width: width,
      height: height,
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }
}
