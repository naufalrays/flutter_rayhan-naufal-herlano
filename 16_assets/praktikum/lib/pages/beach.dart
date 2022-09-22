import 'package:flutter/material.dart';

class BeachPage extends StatelessWidget {
  const BeachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/beach.jpg'),
      fit: BoxFit.cover,
    );
  }
}
