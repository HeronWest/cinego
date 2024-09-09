import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeloClassificaoIndicativa extends StatelessWidget {
  int idade;
  double? height;
  double? width;
  BorderRadius? borderRadius;
  SeloClassificaoIndicativa({super.key, required this.idade, this.height, this.width, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 34,
      width: width ?? 34,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: idade >= 18 ? Colors.black : idade >= 16
            ? Colors.red
            : idade >= 14
            ? Colors.orange
            : idade >= 12 ? Colors.yellow : Colors.green,
        borderRadius: borderRadius ?? BorderRadius.only(
          bottomLeft: Radius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          '${idade < 12 ? 'L' : idade}',
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
