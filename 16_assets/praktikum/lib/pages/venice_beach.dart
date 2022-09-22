import 'package:flutter/material.dart';

class VeniceBeachPage extends StatelessWidget {
  const VeniceBeachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/venice_beach.jpg'),
      fit: BoxFit.cover,
    );
  }
}
