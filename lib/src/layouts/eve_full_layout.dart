import 'package:flutter/material.dart';

import '../../eve.dart';

class EveFullLayout extends StatelessWidget {

  final Color? bgColor;
  final Widget? child;
  EveFullLayout({this.bgColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: EveHideKeyboardContainer(
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
