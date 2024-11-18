import 'package:flutter/material.dart';
import '../theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 95,
            height: 30,
            child:
                Center(child: Text(label, style: TextStyle(color: whiteclr))),
            decoration: BoxDecoration(
                color: purpleclr, borderRadius: BorderRadius.circular(14))));
  }
}
