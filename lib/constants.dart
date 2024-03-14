import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextField({required TextEditingController controller, int? maxLines = 1, String? Function(String?)? validator,required String hintText, Widget? prefixIcon, Widget? suffixIcon})
{
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(15),
          borderSide:BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}