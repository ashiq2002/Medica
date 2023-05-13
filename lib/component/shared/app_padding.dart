import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const AppPadding({Key? key, this.padding, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15,),
      child: child,
    );
  }
}
