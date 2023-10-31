
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meida_app/styles/theme.dart';

class MonsarratText extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextDecoration? decoration;

  const MonsarratText(this.text,
      {Key? key,
      this.weight,
      this.size = 13,
      this.color,
      this.textAlign,
      this.maxLines,
      this.decoration,
      this.height = 16,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.montserrat(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: size,
        color: color ?? AppColors.primaryColor,
        height: height?.toFigmaHeight(size),
        decoration: decoration,
      ),
    );
  }
}

extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}
