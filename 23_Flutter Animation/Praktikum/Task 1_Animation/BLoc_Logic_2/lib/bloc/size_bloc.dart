import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'size_event.dart';
part 'size_state.dart';

class SizeBloc extends Bloc<SizeEvent, SizeState> {
  SizeBloc() : super(SizeInitial()) {
    bool isBig = true;
    on<ChangeSize>((event, emit) {
      if (state is SizeInitial) {
        emit(SizeChanged(isBig: isBig));
      }

      if (state is SizeChanged) {
        bool newIsBig = isBig = !isBig;

        emit(SizeChanged(isBig: newIsBig));
        print(newIsBig);
      }
    });
  }
}
