import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_example/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('BlueCubit',(){

    test('initial state is - 3',(){
      expect(BlueCubit().state, -3);
    });

    group('increment', (){

      blocTest<BlueCubit, int>(
        'emit [-2] whent state is -3',
        build: ()=> BlueCubit(),
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[-2],
      );

      blocTest<BlueCubit,int>(
        'emit [88] when state is 87',
        build: () => BlueCubit(),
        seed: () => 87,
        act: (cubit) => cubit.increment(),
        expect: ()=> const <int>[88]
      );

    });

    group('decrement', () {
      
      blocTest<BlueCubit,int>(
        'emit [-4] when state is -3',
        build:() => BlueCubit(),
        act: (cubit) => cubit.decrement(),
        expect: ()=> const <int>[-4]
      );

      blocTest<BlueCubit,int>(
      'emit [-4,-5] when state is -3',
      build: ()=> BlueCubit(),
      act: (cubit) => cubit
                    ..decrement()
                    ..decrement(),
       expect: ()=> const <int>[-4,-5]
      );
    });

    group('insertValue', (){
  
      blocTest<BlueCubit,int>(
        'emit [7] whent state is - 3',
        build: ()=> BlueCubit(),
        act: (cubit) => cubit.insertValue(7),
        expect: ()=> const <int>[7]
      );

      blocTest<BlueCubit,int>(
        'emit [-10,-15] when state is -3',
         build: ()=> BlueCubit(),
         act: (cubit)=> cubit
                    ..insertValue(-10)
                    ..insertValue(-15),
        expect: ()=> const <int>[-10,-15]
      );
      
    });

  });
}