// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    Key? key,
    this.buttonName,
    this.onTap,
  }) : super(key: key);

  final String? buttonName;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: 100, // <-- match_parent
    //   height: 40,
    //   child: ElevatedButton(
    //     onPressed: () {},
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all<Color>(primary),
    //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //         RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(18.0),
    //           // side: const BorderSide(color: Colors.red),
    //         ),
    //       ),
    //     ),
    //     child: Text(
    //       buttonName!,
    //     ),
    //   ),
    // );
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: size.width * 0.6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: Text(
          buttonName!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
