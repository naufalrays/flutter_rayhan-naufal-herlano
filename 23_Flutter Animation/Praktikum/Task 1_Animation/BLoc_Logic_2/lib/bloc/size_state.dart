// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'size_bloc.dart';

abstract class SizeState extends Equatable {
  const SizeState();

  @override
  List<Object> get props => [];
}

class SizeInitial extends SizeState {
  @override
  List<Object> get props => [];
}

class SizeChanged extends SizeState {
  bool isBig;
  SizeChanged({
    required this.isBig,
  });

  @override
  List<Object> get props => [isBig];
}
