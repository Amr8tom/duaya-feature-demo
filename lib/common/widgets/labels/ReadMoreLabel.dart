import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? trimLines;
  const ReadMoreLabel(
      {super.key,
      required this.text,
      this.style,
      this.textAlign,
      this.trimLines});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      textAlign: textAlign,
      trimMode: TrimMode.Line,
      trimLines: trimLines ?? 3,
      colorClickableText: Colors.pink,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
    );
  }
}
