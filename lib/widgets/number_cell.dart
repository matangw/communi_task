import 'package:auto_size_text/auto_size_text.dart';
import 'package:communi_assignment/models/number_object.dart';
import 'package:flutter/material.dart';

class NumberCell extends StatelessWidget {
  final NumberObject numberObject;
  final int? pressedNummber;
  final Function() onTapDown;
  final Function() onTapUp;

  final double height;

  const NumberCell({
    super.key,
    required this.numberObject,
    required this.pressedNummber,
    required this.onTapDown,
    required this.onTapUp,
    this.height = 50,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => onTapDown(),
      onTapUp: (_) => onTapUp(),
      onTapCancel: onTapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            color: cellColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: AutoSizeText(
            numberObject.number.toString(),
            overflow: TextOverflow.ellipsis,
            minFontSize: 5,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  //Returns true if the number has a gcd (greatest common divisor) with the pressed number
  bool get hasGcd {
    return pressedNummber != null &&
        numberObject.number.gcd(pressedNummber!) > 1;
  }

  //Returns the color of the cell
  Color get cellColor {
    if (hasGcd) {
      return Colors.blue;
    } else if (numberObject.isPrime) {
      return Colors.red;
    }
    return Colors.white;
  }

  //Returns the color of the text
  Color get textColor {
    if (cellColor == Colors.white) {
      return Colors.black;
    }
    return Colors.white;
  }
}
