// ignore_for_file: prefer_const_constructors
import 'package:cubit_example/counter/counter.dart';
import 'package:cubit_example/counter/utils/keys.dart';
import 'package:cubit_example/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockBlueCubit extends MockCubit<int> implements BlueCubit{}
class MockGreenCubit extends MockCubit<int> implements GreenCubit{}
class MockSumBloc extends MockBloc<SumEvent,SumState> implements SumBloc{}

const _blueButtonIncrementKey = Key(kBlueButtonIncrement);
const _blueButtonDecrementKey = Key(kBlueButtonDecrement);
const _blueButtonInsertValueKey = Key(kBlueButtonInsertValue);

const _greenButtonIncrementKey = Key(kGreenButtonIncrement);
const _greenButtonDecrementKey = Key(kGreenButtonDecrement);
const _greenButttonInsertValueKey = Key(kGreenButtonInsertValue);

void main() {
  late BlueCubit blueCubit;
  late GreenCubit greenCubit;
  late SumBloc sumBloc;

  setUp((){
    blueCubit = MockBlueCubit();
    greenCubit = MockGreenCubit();
    sumBloc = MockSumBloc();
  });

  group('CounterView',(){
    
    testWidgets('render current CounterCubit state',(tester) async{
      when(() => blueCubit.state).thenReturn(44);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: blueCubit,
            child: CounterTextBlue(),
          )
        )
      );
      expect(find.text('44'), findsOneWidget);
    });

   testWidgets('tapping increment blue button invokes increment', (tester) async{
     when(() => blueCubit.state).thenReturn(0);
     when(() => greenCubit.state).thenReturn(0);
     when(() => sumBloc.state).thenReturn(SumState(b: 0,g:0,sum: 0));
     when(() => blueCubit.increment()).thenReturn((){});
     await tester.pumpWidget(
       MaterialApp(
         home: MultiBlocProvider(
             providers: [
                 BlocProvider.value(
                    value: blueCubit,
                  ),
                 BlocProvider.value(
                     value:  greenCubit,
                 ),
                 BlocProvider.value(
                     value:  sumBloc,
                 ),
             ],
                        child: CounterView(),
         )
       )
     );
     await tester.tap(find.byKey(_blueButtonIncrementKey));
     verify( () => blueCubit.increment()).called(1);
   });

  testWidgets('tapping decrement blue button invokes descrement',(tester)async{
     when(() => blueCubit.state).thenReturn(0);
     when(() => greenCubit.state).thenReturn(0);
     when(() => sumBloc.state).thenReturn(SumState(b: 0,g:0,sum: 0));
     when(() => blueCubit.increment()).thenReturn((){});
     await tester.pumpWidget(
           MaterialApp(
         home: MultiBlocProvider(
             providers: [
                 BlocProvider.value(
                    value: blueCubit,
                  ),
                 BlocProvider.value(
                     value:  greenCubit,
                 ),
                 BlocProvider.value(
                     value:  sumBloc,
                 ),
             ],
                        child: CounterView(),
         )
       )
     );
     await tester.tap(find.byKey(_blueButtonDecrementKey));
     verify( () => blueCubit.decrement()).called(1);
  });
  testWidgets('tapping inserValue blue button invokes inserValue',(tester)async{
     when(() => blueCubit.state).thenReturn(0);
     when(() => greenCubit.state).thenReturn(0);
     when(() => sumBloc.state).thenReturn(SumState(b: 0,g:0,sum: 0));
     when(() => blueCubit.decrement()).thenReturn((){});
     await tester.pumpWidget(
           MaterialApp(
         home: MultiBlocProvider(
             providers: [
                 BlocProvider.value(
                    value: blueCubit,
                  ),
                 BlocProvider.value(
                     value:  greenCubit,
                 ),
                 BlocProvider.value(
                     value:  sumBloc,
                 ),
             ],
                        child: CounterView(),
         )
       )
     );
     await tester.tap(find.byKey(_blueButtonInsertValueKey));
     verify( () => blueCubit.insertValue(10)).called(1);
    //  verify( () => sumBloc.add(BlueValue(value: 10))).called(1);
  });

  });
}