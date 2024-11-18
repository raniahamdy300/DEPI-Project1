import 'package:flutter/material.dart';
import '../theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(title),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  controller: controller,
                  showCursor: true,
                  decoration: InputDecoration(
                    //labelText: title,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    hintText: hint, hintStyle: hintStyle,
                  ),
                ),
              ),
              widget == null ? Container() : Container(child: widget),
            ],
          ),
        ],
      ),
    );
  }
}
