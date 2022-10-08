// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'size_bloc.dart';

class SizeState extends Equatable {
  bool isBig;
  SizeState({required this.isBig});

  @override
  List<Object> get props => [isBig];
}
