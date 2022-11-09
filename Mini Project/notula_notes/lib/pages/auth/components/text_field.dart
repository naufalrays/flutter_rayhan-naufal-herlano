// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    Key? key,
    this.controller,
    required this.isPassword,
    this.hintText,
    this.message,
    required this.isEmail,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final String? message;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      // decoration: BoxDecoration(
      //   color: Colors.grey[350],
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(8.0),
      //   ),
      // ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText!,
          fillColor: Colors.grey[250],
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value != null && isEmail) {
            if (!EmailValidator.validate(value)) {
              return message;
            } else {
              return null;
            }
          } else {
            if (value!.isEmpty) {
              return message;
            }
          }
          return null;

          // if (value!.isEmpty) {
          //   if (isEmail == true) {
          //     if (!EmailValidator.validate(value)) {
          //       return 'Enter an email';
          //     }
          //   } else {
          //     return message;
          //   }
          // } else {
          //   if (isEmail == true) {
          //     if (!EmailValidator.validate(value)) {
          //       return 'Enter a valid email';
          //     } else {
          //       return null;
          //     }
          //   } else {
          //     return null;
          //   }
          // }
          // return null;
        },
      ),
    );
  }
}
