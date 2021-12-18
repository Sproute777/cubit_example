part of 'sum_bloc.dart';

abstract class SumEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class BlueValue extends SumEvent{
  BlueValue({required this.value});
  final int value;
  @override 
  List<Object> get props => [value];
}

class GreenValue extends SumEvent{
  GreenValue({required this.value});
  final int value;
  @override 
  List<Object> get props => [value];
}
