import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String? hintText;
  Widget? suffixIcon;
  double? width;
  TextEditingController? controller;
  void Function()? onTap;
  bool? readOnly;

  AppTextField({

    this.suffixIcon,
    this.hintText,
    this.width,
    this.controller,
    this.onTap,
    this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 80,
        width: width ?? double.infinity,
        child: TextField(
          readOnly: readOnly ?? false,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            )),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
