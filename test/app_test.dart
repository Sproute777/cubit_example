//ignore_for_file: prefer_const_constructors
import 'package:cubit_example/counter/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:cubit_example/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cubit example App', () {

   testWidgets('is a MaterialApp',(tester)async{
     expect( App(), isA<MaterialApp>());
   });

   testWidgets('home is CounterPage',(tester) async{
     expect(App().home, isA<CounterPage>());
   });

   testWidgets('renders CounterPage', (tester)async{
     await tester.pumpWidget(App());
     expect(find.byType(CounterPage), findsOneWidget);
   });
   
  });
}