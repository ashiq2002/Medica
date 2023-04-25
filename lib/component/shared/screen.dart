import 'package:flutter/material.dart';
import 'package:medica/component/shared/app_padding.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final List<Widget> actionWidget;
  final bool isBackButton, isActions, isBottomTab, isCenter;
  final String appbarTitle;
  final double shadow;
  final Color backgroundColor;
  final IconThemeData iconThemeData;
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
      this.backgroundColor = Colors.transparent,
      this.iconThemeData = const IconThemeData(color: Colors.black)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isBackButton
          ? AppBar(
              iconTheme: iconThemeData,
              backgroundColor: backgroundColor,
              elevation: shadow,
              actions: isActions ? actionWidget : null,
              centerTitle: isCenter,
              title: Text(
                appbarTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : null,
      body: SafeArea(
        child: AppPadding(
            paddingValue: 15,
            child: SingleChildScrollView(
              child: child,
            )),
      ),
    );
  }
}
