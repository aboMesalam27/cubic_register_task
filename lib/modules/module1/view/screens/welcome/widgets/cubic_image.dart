import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CubicImage extends StatelessWidget {
  const CubicImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo/cubic-logo-dark@2.svg',
    );
  }
}
