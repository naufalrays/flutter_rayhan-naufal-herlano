import 'package:flutter/material.dart';
import 'package:flutter_animation_bloc/bloc/size_bloc.dart';
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
        child: InkWell(
          onTap: () {
            BlocProvider.of<SizeBloc>(context).add(ChangeSize());
          },
          child: BlocBuilder<SizeBloc, SizeState>(
            builder: (context, state) {
              if (state is SizeInitial) {
                return const CircularProgressIndicator();
              } else if (state is SizeChanged) {
                return AnimatedContainer(
                  height: state.isBig ? 300 : 200,
                  width: state.isBig ? 300 : 200,
                  duration: const Duration(milliseconds: 300),
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2017/04/02/16/58/woman-2196323_960_720.jpg'),
                );
              }

              return const Text('Something went wrong');
            },
          ),
        ),
      ),
    );
  }
}
