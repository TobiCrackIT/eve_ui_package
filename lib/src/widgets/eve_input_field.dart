import 'package:eve/src/shared/app_colors.dart';
import 'package:eve/src/shared/spacer.dart';
import 'package:flutter/material.dart';

class EveInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int maxLines;
  final String? title;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;
  final bool password;
  final void Function()? trailingTapped;
  final Function(String)? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  final eveBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );

  EveInputField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.keyboardType:TextInputType.text,
    this.maxLines:1,
    this.title = '',
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.enabled = false,
    this.password = false,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            EveSpace.horizontalSpaceXSmall,
            Text(
              title!,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: enabled ? kEveCeruleanBlue : kEveJacarta,
                  ),
            ),
          ],
        ),
        EveSpace.verticalSpaceXSmall,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: kEveWhite,
            /*boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 64,
                offset: Offset(0, 7),
                color: Color.fromRGBO(0, 0, 0, 0.07),
              )
            ],*/
          ),
          child: TextField(
            controller: controller,
            onTap: focusNode!.requestFocus,
            focusNode: focusNode,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: password,
            obscuringCharacter: '●',
            decoration: InputDecoration(
              hintText: placeholder,
              filled: true,
              fillColor: kEveAliceBlue,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
            onChanged: onChanged,
            onSubmitted: onFieldSubmitted,
          ),
        ),
      ],
    );
  }
}
