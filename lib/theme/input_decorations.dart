import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,

    Color borderColor = const Color(0xff1c89b1),
    Color focusColor  = const Color(0xff99ceda),
    Color labelColor  = const Color(0xff99ceda),
    Color iconColor   = const Color(0xff1c89b1)

  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: borderColor
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusColor,
            width: 2,
          ),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: iconColor)
            : null
    );
  }
}