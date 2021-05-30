import 'package:eve/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

class EveInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final void Function()? trailingTapped;

  final eveBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );

  EveInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          hintText: placeholder,
          filled: true,
          fillColor: kEveAliceBlue,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          prefixIcon: leading,
          suffixIcon: trailing != null
              ? GestureDetector(
                  onTap: trailingTapped,
                  child: trailing,
                )
              : null,
          border: eveBorder.copyWith(
            borderSide: BorderSide(color: kEveAliceBlue),
          ),
          disabledBorder: eveBorder.copyWith(
            borderSide: BorderSide(color: kEveAliceBlue),
          ),
          enabledBorder: eveBorder.copyWith(
            borderSide: BorderSide(color: kEveAliceBlue),
          ),
          focusedBorder: eveBorder.copyWith(
            borderSide: BorderSide(color: kEveCeruleanBlue),
          ),
        ),
      ),
    );
  }
}
