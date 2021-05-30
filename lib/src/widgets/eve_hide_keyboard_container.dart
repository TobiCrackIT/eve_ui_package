import 'package:flutter/material.dart';

class EveHideKeyboardContainer extends StatelessWidget {

  final Widget? child;
  EveHideKeyboardContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: child
    );
  }
}
