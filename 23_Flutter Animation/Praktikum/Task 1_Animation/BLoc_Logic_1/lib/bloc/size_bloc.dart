import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'size_event.dart';
part 'size_state.dart';

class SizeBloc extends Bloc<SizeEvent, SizeState> {
  SizeBloc() : super(SizeState(isBig: false)) {
    // bool isBig = false;
    // on<SizeEvent>(
    //   (event, emit) {
    //     if (event is ChangeSize) {
    //       // print('${!event.isBig}');
    //       bool newBig = isBig = !isBig;
    //       emit(SizeState(isBig: isBig));
    //       print('$isBig');
    //     }
    //   },
    // );
    on<SizeEvent>(
      (event, emit) {
        if (event is ChangeSize) {
          // print('${!event.isBig}');
          bool newBig = state.isBig = event.isBig;
          bool newBigss = !newBig;
          emit(SizeState(isBig: newBigss));
          print('$newBigss');
        }
      },
    );
  }
}
