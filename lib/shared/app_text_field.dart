import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  String? hintText;
  Widget? suffixIcon;
  void Function(String)? onChanged;
  double? width;
  TextEditingController? controller;
  void Function()? onTap;
  bool? readOnly;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? hintStyle;

  AppTextField({
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.hintText,
    this.width,
    this.controller,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.hintStyle,
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
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          keyboardType: keyboardType,
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
            hintStyle: hintStyle ?? GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
