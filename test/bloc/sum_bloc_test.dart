// import 'package:cubit_example/counter/bloc/sum_bloc.dart';
// import 'package:cubit_example/counter/cubit/counter_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:bloc_test/bloc_test.dart';

// тест не пройден

// void main () {

//   group('SumBloc',(){

//     test('initial state is b = -3 , g = 2 , sum = 1',(){
//       expect(SumBloc(blueCubit: BlueCubit(), greenCubit: GreenCubit()).state, const SumState(b: -3,g: 2, sum: 1));
//     });

//     group('Counting', (){
      
//       // test('sum cubit test ',(){
//       // expect( 
//       //   SumBloc(
//       //     blueCubit: BlueCubit()..increment(),
//       //      greenCubit: GreenCubit()..insertValue(10)).state 
           
//       //       ,
           
//       //       const SumState(b: -2, g: 10 , sum: 8));
//       blocTest(
//         'emit [8] when state is 1',
//         build: ()=> SumBloc(blueCubit: BlueCubit()..increment(), greenCubit: GreenCubit()..insertValue(10)),
//         // act: (cubit)=> cubit(),
//         expect: ()=> const [SumState(b: -2, g: 10 , sum: 8)]
//       );
//       // });
//     });
    
//   });
// }