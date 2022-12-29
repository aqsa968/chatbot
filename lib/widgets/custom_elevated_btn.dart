import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? minimumSize;
  final Widget child;
  final double? radius;
  final BorderSide? side;
  final EdgeInsetsGeometry? padding;
  final MaterialTapTargetSize? tapTargetSize;
  final OutlinedBorder? shape;

  const CustomElevatedBtn({
    Key? key,
    this.side,
    this.minimumSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    this.radius,
    this.padding,
    this.tapTargetSize,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: tapTargetSize,
        padding: padding,
        side: side,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: minimumSize,
        shape: (radius == null)
            ? shape
            : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
      ),
      child: child,
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? minimumSize;
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final MaterialTapTargetSize? tapTargetSize;
  final BorderSide? side;
  final OutlinedBorder? shape;

  const CustomTextBtn({
    Key? key,
    this.minimumSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    this.radius,
    this.padding,
    this.tapTargetSize,
    this.side,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        tapTargetSize: tapTargetSize,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: minimumSize,
        side: side,
        shape: (radius == null)
            ? shape
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!),
              ),
      ),
      child: child,
    );
  }
}
