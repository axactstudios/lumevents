import 'package:flutter/material.dart';
import 'package:lumevents/theme.dart' as Theme;

class FormFields extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  FormFields(this.controller, this.hintText);
  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.5, vertical: 15.0),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Theme.MyColors.themeColor)),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please Select type';
          }
          return null;
        },
      ),
    );
  }
}
