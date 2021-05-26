import 'package:flutter/material.dart';
import '../core/app_const.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final EdgeInsets padding;
  final double height;
  final double radius;

  const PrimaryButton({
    Key key,
    this.onPressed,
    this.label,
    this.padding = const EdgeInsets.only(top: kButtonPadding),
    this.height = kButtonHeight,
    this.radius = kButtonRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label?.toString() ?? ''),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
