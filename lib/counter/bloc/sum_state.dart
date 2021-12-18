part of 'sum_bloc.dart';

class SumState extends Equatable{
  final int b;
  final int g;
  final int sum;
  const SumState({
     this.b  = -3,
     this.g = 2,
     this.sum = 1,
  });

  SumState copyWith({
    int? b,
    int? g,
    }){
      final _b = b ?? this.b;
      final _g = g ?? this.g;

    return SumState(
      b: _b,
      g: _g,
      sum: _b + _g,
    );
  }

  @override
  List<Object> get props => [b,g,sum];
}
