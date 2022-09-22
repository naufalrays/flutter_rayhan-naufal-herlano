import 'package:flutter/material.dart';

class ChillPage extends StatelessWidget {
  const ChillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/chill.jpg'),
      fit: BoxFit.cover,
    );
  }
}
