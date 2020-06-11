//import 'package:flutter/material.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';
//
//class CustomAppBar extends AppBar {
//  @override
//  // TODO: implement backgroundColor
//  Color get backgroundColor => Color(0xFFFF4B8F);
//  @override
//  // TODO: implement title
//  Widget get title => Text(
//        'LumEvents',
//        style: TextStyle(fontSize: 24, fontFamily: 'sf_pro'),
//      );
//  @override
//  // TODO: implement leading
//  Widget get leading => SearchableDropdown.single(
//        items: ExampleNumber.list.map((exNum) {
//          return (DropdownMenuItem(
//              child: Text(exNum.numberString), value: exNum));
//        }).toList(),
//        value: selectedNumber,
//        hint: "Select one number",
//        searchHint: "Select one number",
//        onChanged: (value) {
//          setState(() {
//            selectedNumber = value;
//          });
//        },
//        dialogBox: true,
//        isExpanded: true,
//      );
//}
