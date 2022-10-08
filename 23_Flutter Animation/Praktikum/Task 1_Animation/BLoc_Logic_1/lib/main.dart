import 'package:flutter/material.dart';
import 'package:flutter_animation/bloc/size_bloc.dart';
import 'package:flutter_animation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SizeBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
