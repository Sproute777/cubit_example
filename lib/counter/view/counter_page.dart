import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter.dart';
import 'counter_view.dart';

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
        child: const CounterView(),
     
    );
  }
}

