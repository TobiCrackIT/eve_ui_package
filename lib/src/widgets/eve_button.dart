import 'package:flutter/material.dart';

class EveButton extends StatelessWidget {
  final String? title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Color? bgColor;
  final Color? borderColor;
  final double borderRadius;

  const EveButton(
      {Key? key,
      required this.title,
      this.disabled: false,
      this.busy: false,
      this.onTap,
      this.leading,
      this.borderRadius: 50,
      this.borderColor: Colors.white,
      required this.bgColor})
      : outline = false,
        super(key: key);

  const EveButton.outline({
    required this.title,
    this.onTap,
    this.leading,
    required this.borderColor,
    this.borderRadius: 50,
    this.bgColor: Colors.white,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: double.infinity,
        height: 48,
        duration: Duration(milliseconds: 300),
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? bgColor! : bgColor!.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                border: Border.all(
                  width: 1,
                  color: borderColor!,
                ),
              ),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) SizedBox(width: 5),
                ],
              )
            : CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation(borderColor!),
              ),
      ),
    );
  }
}
