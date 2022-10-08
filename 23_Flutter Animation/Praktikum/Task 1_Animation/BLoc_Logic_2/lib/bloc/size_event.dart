part of 'size_bloc.dart';

abstract class SizeEvent extends Equatable {
  const SizeEvent();

  @override
  List<Object> get props => [];
}

class ChangeSize extends SizeEvent {}
