import 'package:flutter/material.dart';
import 'package:login_page/txtfld.dart';

class Rtxtf extends StatelessWidget {
  Rtxtf(
      {Key? key,
      required this.type,
      required this.obscureText,
      required this.hint,
      required this.controller,
      required this.focus,
      this.wid})
      : super(key: key);
  TextEditingController controller;
  TextInputType type;
  bool obscureText;
  String hint;
  bool focus;
  Widget? wid;

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder =
        OutlineInputBorder(borderRadius: BorderRadius.circular(15));
    TextAlign textAlign = TextAlign.justify;
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      autofocus: focus,
      textAlign: textAlign,
      decoration: InputDecoration(
        suffix: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
          child: wid,
        ),
        border: inputBorder,
        constraints: BoxConstraints.loose(const Size(250, 40)),
        hintText: hint,
      ),
    );
  }
}
