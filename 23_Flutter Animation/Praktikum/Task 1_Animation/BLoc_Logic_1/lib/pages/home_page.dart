import 'package:flutter/material.dart';
import 'package:flutter_animation/bloc/size_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: Center(
        child: BlocBuilder<SizeBloc, SizeState>(
          builder: (context, state) {
            return InkWell(
                onTap: () {
                  state.isBig;
                  BlocProvider.of<SizeBloc>(context)
                      .add(ChangeSize(isBig: state.isBig));
                },
                child: AnimatedContainer(
                  width: state.isBig ? 300 : 200,
                  height: state.isBig ? 300 : 200,
                  duration: const Duration(milliseconds: 300),
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2017/04/02/16/58/woman-2196323_960_720.jpg'),
                ));
          },
        ),
      ),
    );
  }
}
