import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../counter.dart';

part 'sum_event.dart';
part 'sum_state.dart';

class SumBloc extends Bloc< SumEvent ,SumState> {
  SumBloc({ required BlueCubit blueCubit, required GreenCubit greenCubit}) : 
  _blueCubit = blueCubit,
  _greenCubit = greenCubit,
  super(const SumState()){
    on<BlueValue>(_onBlueValue);
    on<GreenValue>(_onGreenValue);   
    _subsBlue = _blueCubit.stream.listen((b)=> add(BlueValue(value: b)));
    _subsGreen = _greenCubit.stream.listen((g)=> add(GreenValue(value: g)));   
  }
   late final   BlueCubit   _blueCubit;
   late final   GreenCubit  _greenCubit;
   late final   StreamSubscription<int>? _subsBlue;
   late final   StreamSubscription<int>? _subsGreen;

  void _onBlueValue(BlueValue event, Emitter<SumState> emit){
    emit(state.copyWith(b: event.value));
  }
  void _onGreenValue(GreenValue event, Emitter<SumState> emit){
    emit(state.copyWith(g: event.value));
  }


  @override
  Future<void> close() {
    _subsBlue?.cancel();
    _subsGreen?.cancel();
  return  super.close();
  }
  }