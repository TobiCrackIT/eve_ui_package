import 'package:eve/eve.dart';
import 'package:flutter/material.dart';

class EveDropdown extends StatelessWidget {
  final String? asset;
  final String? title;
  final String? currentValue;
  final List<String>? options;
  final Function(String?)? onSelected;
  EveDropdown(
      {this.asset: '',
      this.title,
      this.currentValue,
      this.options,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kEveWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                  color:kEveJacarta,
                ),
              ),
            ],
          ),
          EveSpace.verticalSpaceXSmall,
          Container(
            decoration: BoxDecoration(
              color: kEveAliceBlue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border:
                  Border.all(color: kEveAliceBlue, width: 1),
              /*boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 64,
                  offset: Offset(0, 7),
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                )
              ],*/
            ),
            padding: EdgeInsets.only(left: 16.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: DropdownButton(
                      focusColor: kEveCeruleanBlue,
                      isExpanded: true,
                      hint: Text(
                        title!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14, color: Color.fromRGBO(111, 108, 110, 0.7)),
                      ),
                      dropdownColor: Colors.white,
                      underline: Container(),
                      items: options!.map(
                        (val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      value: currentValue,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 26,
                          color: Color.fromRGBO(32, 14, 50, 0.5),
                        ),
                      ),
                      onChanged: onSelected,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
