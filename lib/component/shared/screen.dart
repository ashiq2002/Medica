import 'package:flutter/material.dart';
import 'package:medica/component/shared/app_padding.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final List<Widget> actionWidget;
  final bool isBackButton, isActions, isBottomTab, isCenter;
  final String appbarTitle;
  final double shadow;
  const Screen(
      {Key? key,
      this.isActions = false,
      this.isBottomTab = false,
      this.isCenter = true,
      this.shadow = 0,
      this.appbarTitle = "",
      this.actionWidget = const [Text("cool")],
      required this.child,
      required this.isBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isBackButton
          ? AppBar(
              elevation: shadow,
              actions: isActions ? actionWidget : null,
              centerTitle: isCenter,
              title: Text(
                appbarTitle,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          : null,
      body: SafeArea(
        child: AppPadding(
            padddingValue: 15,
            child: SingleChildScrollView(
              child: child,
            )),
      ),
    );
  }
}
