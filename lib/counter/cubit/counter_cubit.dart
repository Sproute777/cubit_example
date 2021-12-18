import 'dart:async';

import 'package:bloc/bloc.dart';


class BlueCubit extends Cubit<int> {
  BlueCubit() : super(-3);

  void insertValue(int value)=> emit(value);

  void increment()=> emit( state + 1);

  void decrement()=> emit( state - 1);
  
}

class GreenCubit extends Cubit<int> {
  GreenCubit() : super(2);

  void insertValue(int value)=> emit(value);

  void increment()=> emit( state + 1);

  void decrement()=> emit( state - 1);
  
}

