import 'package:flutter/material.dart';

import '../../eve.dart';

class EveNormalLayout extends StatelessWidget {
  final Widget? child;
  final Color? bgColor;
  final PreferredSizeWidget? header;
  final double horizontalPadding;
  final Widget? fab;

  EveNormalLayout({
    @required this.child,
    this.header,
    this.bgColor,
    this.fab,
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
            floatingActionButton: fab,
          ),
        ),
      ),
    );
  }
}

