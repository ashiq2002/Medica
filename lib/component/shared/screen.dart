import 'package:flutter/material.dart';
import 'package:medica/component/shared/app_padding.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final List<Widget> actionWidget;
  final bool isBackButton, isActions, isBottomTab, isCenter;
  final String appbarTitle;
  final double shadow;
  final Color appBarBackgroundColor;
  final Color backgroundColor;
  final IconThemeData iconThemeData;
  final EdgeInsetsGeometry? padding;
  const Screen(
      {Key? key,
      this.isActions = false,
      this.isBottomTab = false,
      this.isCenter = true,
      this.shadow = 0,
      this.appbarTitle = "",
      this.actionWidget = const [Text("cool")],
      required this.child,
      required this.isBackButton,
      this.appBarBackgroundColor = Colors.transparent,
      this.iconThemeData = const IconThemeData(color: Colors.black),
      this.backgroundColor = Colors.white, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: isBackButton
          ? AppBar(
              iconTheme: iconThemeData,
              backgroundColor: appBarBackgroundColor,
              elevation: shadow,
              actions: isActions ? actionWidget : null,
              centerTitle: isCenter,
              titleTextStyle: Theme.of(context).textTheme.titleLarge,
              title: Text(
                appbarTitle,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          : null,
      body: SafeArea(
        child: AppPadding(
            padding: padding,
            child: SingleChildScrollView(
              child: child,
            )),
      ),
    );
  }
}
