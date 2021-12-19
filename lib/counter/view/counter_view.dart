import 'package:cubit_example/counter/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint("CounterView build");
    return SizedBox(
      width: size.width,
      height: size.height,
      child: DecoratedBox(
        decoration: decorationBox,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar( title: const Text('Counter cubit')),
          body:  Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const<Widget> [
             CounterTextBlue(),
             CounterTextGreen(),
             CounterTextSum()
            ],
          ),
          bottomSheet: SizedBox(
            width: size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[       
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Row(
                  children: <Widget>[
                    ElevatedButton(
                      key: const Key(kBlueButtonIncrement),
                      onPressed: () => context.read<BlueCubit>().increment(),
                      child: const Text('Increase by 1')),
                    ElevatedButton(
                      key: const Key(kBlueButtonDecrement),
                      onPressed: () => context.read<BlueCubit>().decrement(),
                      child: const Text('Decrease by 1')),
                    ElevatedButton(
                      key: const Key(kBlueButtonInsertValue),
                      onPressed: () => context.read<BlueCubit>().insertValue(10),
                      child: const Text('set value 10')),
                  ].expand((w)=> [w, const SizedBox(width: 20,)]).toList(),
                ),
              ]
            ),     
         Row(
            mainAxisSize: MainAxisSize.min, 
            children: <Widget>[
                 ElevatedButton(
                  key: const Key(kGreenButtonIncrement),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () => context.read<GreenCubit>().increment(),
                  child: const Text('Increase by 1')),
                ElevatedButton(
                  key: const Key(kGreenButtonDecrement),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () => context.read<GreenCubit>().decrement(),
                  child: const Text('Decrease by 1')),
                ElevatedButton(
                  key: const Key(kGreenButtonInsertValue),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () => context.read<GreenCubit>().insertValue(10),
                  child: const Text('set value 10')),
                ].expand((w)=> [w , const SizedBox(width: 20)]).toList(),
              ),       
            ].expand( (row) => [const SizedBox(height: 10,), row, const SizedBox(height: 10,)]).toList(),            
                   ),
          ),
        ),
      ),
    );
  }
}

class CounterTextBlue extends StatelessWidget {
  const CounterTextBlue({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterTextBlue build");
    final countNow = context.watch<BlueCubit>().state;
    return BlocBuilder<BlueCubit,int>(
      builder: (context, state){
      return  Text('$countNow', style:  TextStyle(fontSize: 30 , color: Colors.blue[300]!),);
      });
  }
}
class CounterTextGreen extends StatelessWidget {
  const CounterTextGreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterTextGreen build");
    final countNow = context.watch<GreenCubit>().state;
    return Text('$countNow', style: const TextStyle(fontSize: 30 , color: Colors.green),);
  }
}
class CounterTextSum extends StatelessWidget {
  const CounterTextSum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterTextSum build");
    final countNow = context.watch<SumBloc>().state;
    return Text('Sum bath cubits ${countNow.sum}', style: const TextStyle(fontSize: 30 , color: Colors.orange),);
  }
}






  
