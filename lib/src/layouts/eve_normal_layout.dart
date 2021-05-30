import 'package:flutter/material.dart';

import '../../eve.dart';

class TaraNormalLayout extends StatelessWidget {
  final Widget? child;
  final Color? bgColor;
  final PreferredSizeWidget? header;
  final double horizontalPadding;

  TaraNormalLayout({
    @required this.child,
    this.header,
    this.bgColor,
    this.horizontalPadding = 15.0,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: EveHideKeyboardContainer(
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: bgColor,
            appBar: header,
            body: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

