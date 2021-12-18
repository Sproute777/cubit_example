// import 'package:cubit_example/counter/cubit/sum_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
           create: (context) => BlueCubit(), 
          ),
        BlocProvider(
           create: (context) => GreenCubit(), 
          ), 
      BlocProvider<SumBloc>(
        create: (context) => SumBloc(blueCubit: context.read<BlueCubit>(), greenCubit: context.read<GreenCubit>()),
      ),
      ],
        child: const _CounterView(),
     
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterView build");
    return Scaffold(
      appBar: AppBar( title: const Text('Counter cubit')),
      body:  Column( 
        children:  const<Widget> [
      _CounterTextBlue(),
      _CounterTextGreen(),
      _CounterTextSum()
      ]
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.read<BlueCubit>().increment(),
                child: const Text('increase by 1')),
              ElevatedButton(
                onPressed: () => context.read<BlueCubit>().decrement(),
                child: const Text('Decrease by 1')),
              ElevatedButton(
                onPressed: () => context.read<BlueCubit>().insertValue(10),
                child: const Text('set walue 10')),
            ].expand((w)=> [w, const SizedBox(width: 10,)]).toList(),
          ),
        ]
      ),
     Row(
      mainAxisSize: MainAxisSize.min, 
       children: <Widget>[
               ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () => context.read<GreenCubit>().increment(),
                child: const Text('increase by 1')),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () => context.read<GreenCubit>().decrement(),
                child: const Text('Decrease by 1')),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () => context.read<GreenCubit>().insertValue(7),
                child: const Text('set walue 7')),
          ].expand((w)=> [w , const SizedBox(width: 10)]).toList(),
        ),
        const SizedBox(height: 50,)

      ],),
    );
  }
}

class _CounterTextBlue extends StatelessWidget {
  const _CounterTextBlue({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterTextBlue build");
    final countNow = context.watch<BlueCubit>().state;
    return Text('blue cubit is $countNow', style: const TextStyle(fontSize: 30 , color: Colors.blue),);
  }
}
class _CounterTextGreen extends StatelessWidget {
  const _CounterTextGreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterTextGreen build");
    final countNow = context.watch<GreenCubit>().state;
    return Text('green cubit is $countNow', style: const TextStyle(fontSize: 30 , color: Colors.green),);
  }
}
class _CounterTextSum extends StatelessWidget {
  const _CounterTextSum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("CounterTextSum build");
    final countNow = context.watch<SumBloc>().state;
    return Text('Sum bath cubits ${countNow.sum}\n  current state is $countNow', style: const TextStyle(fontSize: 30 , color: Colors.red),);
  }
}



