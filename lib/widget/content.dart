import 'package:flutter/widgets.dart';

class Content extends StatelessWidget {
  String data;
  double size;
  Color? color;
  int? maxLines;
  FontWeight? weight;
  TextAlign? alignment;

  Content(
      {required this.data,
      required this.size,
      this.color,
      this.maxLines,
      this.weight,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: alignment,
      maxLines: maxLines ?? 100,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          overflow: TextOverflow.ellipsis),
    );
  }
}
